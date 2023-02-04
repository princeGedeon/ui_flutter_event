
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui_event_app/components/global.dart';
import 'package:ui_event_app/screens/event_list.dart';
import 'package:ui_event_app/screens/forgotten_password.dart';
import 'package:ui_event_app/screens/forgotten_password_part_two.dart';
import 'package:ui_event_app/screens/homepage.dart';
import 'package:ui_event_app/screens/optionsPage.dart';
import 'package:ui_event_app/screens/signup_page.dart';
import 'package:ui_event_app/utils/app_func.dart';
import 'package:ui_event_app/components/global.dart';

import '../services/apiServices.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscuretext = false;
  bool _checkValue = true;
  late TextEditingController emailCOntroller;
  late TextEditingController passController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailCOntroller=TextEditingController();
    passController=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailCOntroller.dispose();
    passController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: myBlue,
        toolbarHeight: 125,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(65),
                bottomRight: Radius.circular(65))),
        title: Center(
          child: Text(
            "Se connecter",
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
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _checkValue,
                        onChanged: (value) {
                          _checkValue = value!;
                        },
                        title: Text("Se rappeler"),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          navigateToNextPage(context, ForgottenPassword());

                        },
                        child: Text(
                          "Mot de passe oublié?",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: CupertinoButton(
                        color: myBlue,
                        child: Text(
                          "              Connexion            ",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          
                          
                          
                        if(await ApiServices.connect(emailCOntroller.text,passController.text)){
                          navigateToNextPage(context, EventList());
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(snackBar)
                        }
                        
                        
                        
                         // navigateToNextPage(context, HomePage(),back: false);
                        }),
                  ),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        navigateToNextPage(context, SignUpPage());
                      },
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Vous n'avez pas de compte? ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "Inscrivez-vous",
                            style: TextStyle(
                                color: myBlue, fontWeight: FontWeight.bold))
                      ]))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
