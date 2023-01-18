import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_event_app/components/global.dart';

class ForgottenPasswordPartTwo extends StatefulWidget {
  const ForgottenPasswordPartTwo({super.key});

  @override
  State<ForgottenPasswordPartTwo> createState() =>
      _ForgottenPasswordPartTwoState();
}

class _ForgottenPasswordPartTwoState extends State<ForgottenPasswordPartTwo> {
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
                Center(
                  child: Text(
                    "Un code de validation vous a été envoyé par mail",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 30,
                ),
                SizedBox(
                  height: screenHeight / 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: screenHeight / 30,
                ),
                SizedBox(
                  height: screenHeight / 50,
                ),
                Center(
                  child: Text(
                    "Entrez le code à 5 chiffres",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: CupertinoButton(
                        color: myBlue,
                        child: Text(
                          "   Validez le code      ",
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
                                      "Mot de passe changé",
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
                SizedBox(
                  height: screenHeight / 50,
                ),
                Center(
                  child: Text(
                    "N'oubliez pas de consulter vos spams",
                    textAlign: TextAlign.center,
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
