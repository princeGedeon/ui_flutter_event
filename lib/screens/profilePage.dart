import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_event_app/components/global.dart';
import 'package:ui_event_app/components/wrapperprofile.dart';
import 'package:ui_event_app/constants/constant.dart';
import 'package:ui_event_app/screens/event_list.dart';
import 'package:ui_event_app/screens/optionsPage.dart';
import 'package:ui_event_app/services/apiServices.dart';
import 'package:ui_event_app/utils/app_func.dart';

import '../components/input.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController telcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    namecontroller.text = userData[1];
    firstnamecontroller.text = userData[2];
    return WrapperProfile(
        child: Center(
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 35,
          ),
          Input(
            nom: "Nom",
            icon: null,
            inputType: TextInputType.text,
            controller: namecontroller,
          ),
          Input(
            nom: "Prénom",
            icon: null,
            inputType: TextInputType.text,
            controller: firstnamecontroller,
          ),
          Input(
            nom: "Numero de telephone :",
            icon: null,
            inputType: TextInputType.number,
            controller: telcontroller,
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoButton(
            color: myBlue,
            onPressed: () {
              if (![
                namecontroller.text,
                firstnamecontroller.text,
                telcontroller.text
              ].contains("")) {
                var mydata = {
                  "nom": namecontroller.text,
                  "prenom": firstnamecontroller.text,
                  "number_phone": telcontroller.text
                };
                print(mydata);
                ApiServices.editUser(mydata).then((value) =>
                    navigateToNextPage(context, EventList(), back: false));
                toast("Vos informations ont été modifiées");
              } else {
                red_toast("Veuillez remplir tous les champs");
              }
            },
            child: Text(
              "Modifier",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          SizedBox(
            height: 90,
          ),
        ],
      )),
    ));
  }
}
