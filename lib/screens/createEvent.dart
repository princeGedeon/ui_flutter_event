import 'package:flutter/material.dart';
import 'package:ui_event_app/components/wrapperevent.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  @override
  Widget build(BuildContext context) {
    return WrapperEvent(child:  SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Créer un évémenment",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Divider(
                height: 20,
              ),
              Text("veuillez remplir tous les champs"),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Nom de l'événement",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Nom de l'organisateur",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Lieu de l'événement",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                      hintText: "Description",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 248, 8),
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Text("jj/mm/aa"),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.calendar_month))
                    ]),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Type:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 248, 8),
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Text("Payant"),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_drop_down_outlined))
                    ]),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Text:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 248, 8),
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Text("0"),
                      Text("CFA"),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Ajouter des images",
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                    primary: Color.fromARGB(255, 13, 215, 84),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {},
                  child: Text(
                    'CREER',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ))
            ]),
      ),);
  }
}