
import 'package:flutter/material.dart';
import 'package:ui_event_app/components/wrapperevent.dart';

class JoinEvent extends StatefulWidget {
  const JoinEvent({Key? key}) : super(key: key);

  @override
  State<JoinEvent> createState() => _JoinEventState();
}

class _JoinEventState extends State<JoinEvent> {
  @override
  Widget build(BuildContext context) {
    return WrapperEvent(child:  Padding(
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
                    "GALA",
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
                "  12 janvier 2023",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: Row(
              children: [
                Text(
                  "Organisé par:",
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
                Text("  Ministre des sports",
                    style: TextStyle(fontSize: 16))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(35),
            child: Text(
              "Un code participatioon vous a été envoyé par mail",
              style: TextStyle(color: Color.fromARGB(255, 192, 181, 181)),
            ),
          ),
          SizedBox(
            height: 120,
          ),
          const Text(
            "_ _ _ _ _ _",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 30,
                fontWeight: FontWeight.w800),
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
              onPressed: () {},
              child: Text(
                'Envoyer',
                style: TextStyle(color: Colors.white),
              )),
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
