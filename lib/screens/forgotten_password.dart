import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_event_app/components/global.dart';
import 'package:ui_event_app/screens/forgotten_password_part_two.dart';
import 'package:ui_event_app/utils/app_func.dart';

import '../services/apiServices.dart';

class ForgottenPassword extends StatefulWidget {
  const ForgottenPassword({super.key});

  @override
  State<ForgottenPassword> createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  late TextEditingController emailCOntroller;
  late TextEditingController passController;
  late TextEditingController pass2Controller;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  emailCOntroller=TextEditingController();
  passController=TextEditingController();
  pass2Controller=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailCOntroller.dispose();
    pass2Controller.dispose();
    passController.dispose();
    super.dispose();
  }
  bool _obscuretext = true;
  bool _checkValue = true;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
        toolbarHeight: 125,
        title: Container(),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth / 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Mot de passe oublié",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 50,
                ),
                Text(
                  "Définissez votre nouveau mot de passe pour pouvoir vous connecter",
                  textAlign: TextAlign.center,
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
                  controller: emailCOntroller,
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
                  controller: passController,
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
                  controller:pass2Controller,
                  obscureText: _obscuretext,
                  decoration: InputDecoration(
                      prefixIconColor: myBlue,
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
                          "   Réinitialiser mot de passe      ",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {

                              if (await ApiServices.sendpassmail(emailCOntroller.text)){
                                navigateToNextPage(context, ForgottenPasswordPartTwo(pass1: passController.text, pass2: pass2Controller.text,));
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(systemError);
                              }

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
