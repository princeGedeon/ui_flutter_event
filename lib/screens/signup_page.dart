

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui_event_app/components/global.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscuretext = false;
  bool _checkValue = true;
  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myBlue,
        toolbarHeight: 125,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60))),
        elevation: 0,
        title: Center(
          child: Text(
            "S'inscrire",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth / 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight / 20,
                ),
                Text(
                  "Nom du compte",
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: screenHeight / 50,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(Icons.person_outlined)),
                ),
                SizedBox(
                  height: screenHeight / 20,
                ),
                Text(
                  "Date de naissance",
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: screenHeight / 50,
                ),
                DropdownDatePicker(
                  inputDecoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))), // optional
                  isDropdownHideUnderline: true, // optional
                  isFormValidator: true, // optional
                  startYear: 1900, // optional
                  endYear: 2020, // optional
                  width: 0.3, // optional
                  // selectedDay: 14, // optional
                  selectedMonth: 10, // optional
                  selectedYear: 1993, // optional
                  onChangedDay: (value) => print('onChangedDay: $value'),
                  onChangedMonth: (value) => print('onChangedMonth: $value'),
                  onChangedYear: (value) => print('onChangedYear: $value'),
                  //boxDecoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey, width: 1.0)), // optional
                  // showDay: false,// optional
                  // dayFlex: 2,// optional
                  // locale: "zh_CN",// optional
                  // hintDay: 'Day', // optional
                  // hintMonth: 'Month', // optional
                  // hintYear: 'Year', // optional
                  // hintTextStyle: TextStyle(color: Colors.grey), // optional
                ),
                SizedBox(
                  height: screenHeight / 20,
                ),
                Text(
                  "Adresse mail",
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: screenHeight / 50,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(Icons.mail_outlined)),
                ),
                SizedBox(
                  height: screenHeight / 30,
                ),
                Text("Mot de passe"),
                SizedBox(
                  height: screenHeight / 50,
                ),
                TextFormField(
                  obscureText: _obscuretext,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscuretext = !_obscuretext;
                            });
                          },
                          icon: Icon(Icons.visibility_outlined)),
                      prefixIcon: Icon(Icons.lock_outline)),
                ),
                SizedBox(
                  height: screenHeight / 30,
                ),
                Text("Confirmez le mot de passe"),
                SizedBox(
                  height: screenHeight / 50,
                ),
                TextFormField(
                  obscureText: _obscuretext,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscuretext = !_obscuretext;
                            });
                          },
                          icon: Icon(Icons.visibility_outlined)),
                      prefixIcon: Icon(Icons.lock_outline)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: CupertinoButton(
                        color: myBlue,
                        child: Text(
                          "              Inscription            ",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          showDialog(
                              barrierColor: Color.fromRGBO(0, 0, 0, 0),
                              context: context,
                              builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    backgroundColor: myBlue,
                                    title: const Text(
                                      "Inscription réussie",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                    content: CupertinoButton(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 0),
                                        color: Color.fromRGBO(37, 211, 102, 1),
                                        child: Text(
                                          "Retour page connexion",
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.left,
                                        ),
                                        onPressed: () {}),
                                  ));
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
