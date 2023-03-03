import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui_event_app/components/global.dart';
import 'package:ui_event_app/components/wrapperevent.dart';
import 'package:ui_event_app/constants/constant.dart';
import 'package:ui_event_app/constants/constants_api.dart';
import 'package:ui_event_app/screens/event_list_full.dart';
import 'package:ui_event_app/services/apiServices.dart';
import 'package:ui_event_app/screens/detailEvent.dart';
import 'package:ui_event_app/utils/helper_preferences.dart';
import '../models/event.dart';
import '../utils/app_func.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  List<EventModel> events = [];
  bool loading = true;
  List<EventModel> events2 = [];
  List<EventModel> event3 =[];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getAllEvent();
    getUser();
    getAllEventWhoGuest();
    getAllEventWhoCreate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (!loading)
        ? WrapperEvent(
            floatingButton: true,
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    userData[4] == "STANDART"?Container():Container(child:event3.length == 0
                        ? Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 40, left: 40, top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Evenements créé",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            SizedBox(
                              height: 25,
                            ),
                            Text("Vous êtes prémiums ..Créer des événements")
                          ],
                        ),
                      ),
                    )
                        : Container(
                      height: 100,
                        width: getSize(context).width,
                        child: Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: event3.length,
                            itemBuilder: ((context, index) {
                              return eventTile(event3[index],Colors.cyan);
                            }),
                          ),
                        )),),
                        SizedBox(
                          height: 20,
                        ) ,


                    Text(
                      "Evenements participés",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    events2.length == 0
                        ? Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 40, left: 40, top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Vous ne participez à aucun événement",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            SizedBox(
                              height: 25,
                            ),
                            Text("Rejoindre des événements")
                          ],
                        ),
                      ),
                    )
                        : Container(

                        height: 200,
                        width: getSize(context).width,
                        child: Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: events2.length,
                            itemBuilder: ((context, index) {
                              return Container(child:eventTile(events2[index],Colors.blueAccent));
                            }),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Événements disponibles",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        TextButton(
                          child: Text(
                            "Voir tout",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            navigateToNextPage(context, EventListFull());
                          },
                        ),
                      ],
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: events.length != 0
                            ? Column(
                                children: [
                                  Center(
                                    child: Text(
                                        "Glissez vers le bas pour rafraîchir"),
                                  ),
                                  Container(
                                    height: 500,
                                    child: RefreshIndicator(
                                      onRefresh: refresh,
                                      child: ListView.builder(
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return eventTile(events[index],Colors.orangeAccent);
                                        },
                                        itemCount: events.length,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(
                                padding: EdgeInsets.only(
                                    right: 40, left: 40, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Aucun évenement public  disponible",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Future<void> getUser() async {
    var dio = Dio();
    String token = await ApiServices.getToken();
    final response = await dio.get(APiConstants.BASEURL + "api/user/profile/",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.data.toString());
      var data = response.data;
      HelperPreferences.saveStringListValue("userData", [
        data["email"],
        data["nom"],
        data["prenom"],
        data["picture_url"],
        data["profile"],
        data["id"].toString()
      ]);
      userData = await HelperPreferences.retrieveStringListValue("userData");
      print(userData);
      setState(() {
        loading = false;
      });
    } else {}
  }

  Widget eventTile(EventModel event,Color color_t) {
    return Container(
      width: getSize(context).width*0.8,
      child: InkWell(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: color_t,
            child: ListTile(
              leading: Image.network(event.preview),
              isThreeLine: true,
              title: Text(
                event.title,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                formarDate(convertDate(event.start_date)),
                style: TextStyle(color: Colors.white),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Groupe ABE",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          onTap: () {
            navigateToNextPage(context, DetailEvent(id: event.id));
          }),
    );
  }

  Future<void> getAllEvent() async {
    events = await ApiServices.getAllEvent(0);
    setState(() {});
    print(events);
  }

  Future<void> getAllEventWhoGuest() async {
    events2 = await ApiServices.getEventWhoMyGuest();
    setState(() {});
    print(events2);
  }

  Future<void> getAllEventWhoCreate() async {
    event3 = await ApiServices.getEventWhoCreate();
    setState(() {});
    print(event3);
  }

  Future<void> refresh() {
    getAllEvent();
    getAllEventWhoGuest();
    getAllEventWhoCreate();
    return Future.delayed(Duration(seconds: 0));
  }
}
