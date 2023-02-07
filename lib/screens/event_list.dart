import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui_event_app/components/global.dart';
import 'package:ui_event_app/components/wrapperevent.dart';
import 'package:ui_event_app/services/apiServices.dart';

import '../models/event.dart';
import '../utils/app_func.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  List<EventModel> events = [];

  @override
  void initState() {
    // TODO: implement initState
    getAllEvent();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WrapperEvent(
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
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  padding:
                      EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Vous ne participez à aucun événement",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Inscrivez vous à des événements")
                    ],
                  ),
                ),
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
                    child: Container(
                      height: 500,
                      child: RefreshIndicator(
                        onRefresh: refresh,
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, index) {
                            return eventTile(events[index]);
                          },
                          itemCount: events.length,
                        ),
                      ),
                    )),
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
    events = await ApiServices.getAllEvent();
    setState(() {});
    print(events);
  }

  Future<void> refresh() {
    getAllEvent();
    return Future.delayed(Duration(seconds: 0));
  }
}
