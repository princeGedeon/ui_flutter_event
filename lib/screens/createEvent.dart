import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:ui_event_app/components/global.dart';
import 'package:ui_event_app/components/wrapperevent.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ui_event_app/constants/constant.dart';
import 'package:ui_event_app/services/apiServices.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  bool loading = false;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm', 'fr_FR');
  String date_start = "";
  String date_end_subscription = "";
  String date_start_to_show = "Choisissez une date";
  String date_end_subscription_to_show = "Choisissez une date";
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController code_adhesion = TextEditingController();

  String _select_value = "PUBLIC";
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('fr_FR');
    priceController.text = "0";
    return WrapperEvent(
      floatingButton: false,
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 70,
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
              Text("Veuillez remplir tous les champs"),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Nom de l'événement",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: placeController,
                  decoration: InputDecoration(
                      hintText: "Lieu de l'événement",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: code_adhesion,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                      hintText: "Code d'adhésion",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: descriptionController,
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
                child: TextFormField(
                  controller: telController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                      hintText: "Numéro Infoline",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Date de début :",
                      style: TextStyle(
                          color: myBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(date_start_to_show),
                          IconButton(
                              onPressed: () {
                                DatePicker.showDateTimePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime.now(),
                                    maxTime: DateTime(2030, 6, 7),
                                    onConfirm: (date) {
                                  setState(() {
                                    date_start_to_show =
                                        dateFormat.format(date);
                                    date_start = date.toString();
                                  });
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.fr);
                              },
                              icon: Icon(Icons.calendar_month))
                        ]),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Date de fin des inscriptions :",
                      style: TextStyle(
                          color: myBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(date_end_subscription_to_show),
                          IconButton(
                              onPressed: () {
                                DatePicker.showDateTimePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime.now(),
                                    maxTime: DateTime(2030, 6, 7),
                                    onConfirm: (date) {
                                  setState(() {
                                    date_end_subscription_to_show =
                                        dateFormat.format(date);
                                    date_end_subscription = date.toString();
                                  });
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.fr);
                              },
                              icon: Icon(Icons.calendar_month))
                        ]),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Type :",
                        style: TextStyle(
                            color: myBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      DropdownButton(
                          value: _select_value,
                          isExpanded: false,
                          items: [
                            DropdownMenuItem(
                              child: Text("Public"),
                              value: "PUBLIC",
                            ),
                            DropdownMenuItem(
                              child: Text("Privé"),
                              value: "PRIVE",
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              _select_value = value!;
                            });
                          }),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Prix :                      ",
                    style: TextStyle(
                        color: myBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text("CFA"),
                ]),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                    primary: Color.fromARGB(255, 13, 215, 84),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    setState(() {
                      loading = true;
                    });
                    if (![
                      code_adhesion.text,
                      telController.text,
                      nameController.text,
                      priceController.text,
                      descriptionController.text,
                      placeController.text,
                      date_start,
                      date_end_subscription
                    ].contains("")) {
                      var mydata = {
                        "title": nameController.text,
                        "description": descriptionController.text,
                        "type": _select_value,
                        "code_adhesion": code_adhesion.text,
                        "price": priceController.text,
                        "start_date": date_start,
                        "end_date_inscription": date_end_subscription,
                        "location": placeController.text,
                        "number_phone": telController.text,
                        "owner": userData[5].toString(),
                        "category": 1
                      };
                      print(mydata);
                      ApiServices.createEvent(mydata).then((value) {
                        setState(() {
                          loading = false;
                        });
                      });
                    } else {
                      red_toast("Remplissez toutes les informations");
                    }
                  },
                  child: (!loading)
                      ? Text(
                          'CREER',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      : CircularProgressIndicator())
            ]),
      ),
    );
  }
}
