import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:infinite_scroll/infinite_scroll_list.dart';
import 'package:ui_event_app/components/global.dart';
import 'package:ui_event_app/components/wrapperevent.dart';
import 'package:ui_event_app/services/apiServices.dart';

import '../models/event.dart';
import '../utils/app_func.dart';

class EventListFull extends StatefulWidget {
  const EventListFull({super.key});

  @override
  State<EventListFull> createState() => _EventListFullState();
}

class _EventListFullState extends State<EventListFull> {

  List<EventModel> events = [];
  Future<List<EventModel>> getNextPageData(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    if (page == 3) return [];
    final items = ApiServices.getAllEvent(page);
    return items;
  }

  List<EventModel> data = [];
  bool everyThingLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    getAllEvent();

    super.initState();

    loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return WrapperEvent(
      floatingButton: true,
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Vos événements",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Événements publiques",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextButton(
                    child: Text(
                      "Voir tout",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: events.length!=0?
                    InfiniteScrollList(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: data.map((e) => eventTile(e)).toList(),
                      onLoadingStart: (page) async {
                        List<EventModel> newData = await getNextPageData(page);
                        setState(() {
                          data += newData;
                          if (newData.isEmpty) {
                            everyThingLoaded = true;
                          }
                        });
                      },
                      everythingLoaded: everyThingLoaded,
                    )



                        : Container(
                      padding:
                      EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Aucun évenement public  disponible",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),

                        ],
                      ),
                    ),

              ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget eventTile(EventModel event) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.orangeAccent,
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
    );
  }

  Future<void> getAllEvent() async {
    events = await ApiServices.getAllEvent(0);
    setState(() {});
    print(events);
  }

  Future<void> refresh() {
    getAllEvent();
    return Future.delayed(Duration(seconds: 0));
  }

  Future<void> loadInitialData() async {
    data = await getNextPageData(1);
    setState(() {});
  }

}
