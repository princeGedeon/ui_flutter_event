import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ui_event_app/components/global.dart';
import 'package:ui_event_app/services/apiServices.dart';

import '../models/event.dart';

class DetailEvent extends StatefulWidget {
  DetailEvent({super.key, required this.id});
  final int id;

  @override
  State<DetailEvent> createState() {
    initializeDateFormatting().then((value) => _DetailEventState());
    return _DetailEventState();
  }
}

class _DetailEventState extends State<DetailEvent> {
  late EventModel event;
  bool loading = false;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm', 'fr_FR');

  @override
  void initState() {
    // TODO: implement initState
    event = EventModel(
        id: widget.id,
        title: "",
        description: "",
        date: "",
        preview: "",
        type: "",
        code_adhesion: "",
        price: "",
        start_date: "",
        end_date: "",
        end_date_inscription: "",
        status: "",
        location: "",
        number_phone: "",
        latitude: 0,
        longitude: 0,
        is_active: true,
        category: 0,
        owner: 0,
        guests: []);
    getDetailEvent(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset:
                                  Offset(2, 0), // changes position of shadow
                            ),
                          ],
                          color: Color.fromARGB(255, 249, 250, 250),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          event.title,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Text(
                              "Date: ${dateFormat.format(DateTime.parse(event.start_date))}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 47, 189, 52),
                                  fontSize: 18),
                            ),
                            SizedBox(
                              width: 98,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Deadline   ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 47, 189, 52),
                                  fontSize: 18),
                            ),
                            Text(
                              dateFormat.format(
                                  DateTime.parse(event.end_date_inscription!)),
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          event.description.toString(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 10, 10, 10),
                              fontSize: 18),
                        ),
                      ],
                    ),
                    Text("...................."),
                    Row(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text("Frais de participation (FCFA)  : ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 47, 189, 52),
                                fontSize: 18)),
                        Text(
                          event.price.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image.network(event.preview),
                    SizedBox(
                      height: 30,
                    ),
                    CupertinoButton(
                        color: myBlue,
                        child: (!loading)
                            ? Text("Participer")
                            : CircularProgressIndicator(),
                        onPressed: () {
                          setState(() {
                            loading = true;
                          });
                          ApiServices.joinEvent(event.code_adhesion!, event.id)
                              .then((value) {
                            setState(() {
                              loading = false;
                            });
                          });
                        })
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  getDetailEvent(int id) async {
    event = await ApiServices.getEventbyId(id);
    print(event);
    setState(() {});
  }
}
