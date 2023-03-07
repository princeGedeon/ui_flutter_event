import 'package:flutter/material.dart';
import 'package:ui_event_app/components/wrapperevent.dart';
import 'package:ui_event_app/models/event.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ui_event_app/services/apiServices.dart';

class JoinEvent extends StatefulWidget {
  final EventModel event;
  const JoinEvent({Key? key, required this.event}) : super(key: key);

  @override
  State<JoinEvent> createState() => _JoinEventState();
}

class _JoinEventState extends State<JoinEvent> {
  DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm', 'fr_FR');
  bool loading = false;
  TextEditingController code_adhesion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return WrapperEvent(
        floatingButton: false,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        widget.event.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 25),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "Date:",
                    style: TextStyle(
                        color: Color.fromARGB(
                          255,
                          115,
                          255,
                          119,
                        ),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    dateFormat.format(DateTime.parse(widget.event.start_date)),
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(35),
                child: Text(
                  "Un code participatioon est exigé pour cet évènement",
                  style: TextStyle(color: Color.fromARGB(255, 192, 181, 181)),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              TextFormField(
                controller: code_adhesion,
                decoration: InputDecoration(hintText: "Code de participation"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    setState(() {
                      loading = true;
                    });
                    ApiServices.joinEvent(code_adhesion.text, widget.event.id)
                        .then((value) {
                      setState(() {
                        loading = false;
                      });
                    });
                  },
                  child: (!loading)
                      ? Text(
                          'Envoyer',
                          style: TextStyle(color: Colors.white),
                        )
                      : CircularProgressIndicator()),
              Divider(
                height: 20,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Text(
                "Demande en cours",
                style: TextStyle(color: Color.fromARGB(255, 192, 181, 181)),
              )
            ]),
          ),
        ));
  }
}
