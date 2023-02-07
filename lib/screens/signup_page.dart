import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_event_app/components/global.dart';
import 'package:ui_event_app/screens/signin_page.dart';
import 'package:ui_event_app/services/apiServices.dart';

import '../utils/app_func.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscuretext = false;
  bool _checkValue = true;

  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController passController2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    passController2 = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passController.dispose();
    nameController.dispose();
    surnameController.dispose();
    passController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myBlue,
        toolbarHeight: 125,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60))),
        elevation: 0,
        title: const Center(
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
                const Text(
                  "Nom",
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: screenHeight / 50,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(Icons.person_outlined)),
                ),
                SizedBox(
                  height: screenHeight / 20,
                ),
                const Text(
                  "Prénom",
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: screenHeight / 50,
                ),
                TextFormField(
                  controller: surnameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(Icons.person_outlined)),
                ),
                SizedBox(
                  height: screenHeight / 20,
                ),
                const Text(
                  "Adresse mail",
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: screenHeight / 50,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(Icons.mail_outlined)),
                ),
                SizedBox(
                  height: screenHeight / 30,
                ),
                const Text("Mot de passe"),
                SizedBox(
                  height: screenHeight / 50,
                ),
                TextFormField(
                  controller: passController,
                  obscureText: _obscuretext,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
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
                const Text("Confirmez le mot de passe"),
                SizedBox(
                  height: screenHeight / 50,
                ),
                TextFormField(
                  controller: passController2,
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
                        onPressed: () async {
                          print("hello");
                          if (await ApiServices.register(
                              emailController.text,
                              passController.text,
                              passController2.text,
                              nameController.text,
                              surnameController.text)) {
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0),
                                          color:
                                              Color.fromRGBO(37, 211, 102, 1),
                                          child: Text(
                                            "Retour page connexion",
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.left,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            navigateToNextPage(
                                                context, SignInPage(),
                                                back: false);
                                          }),
                                    ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(systemError);
                          }
                        }),
                  ),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        navigateToNextPage(context, SignInPage(), back: false);
                      },
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Vous avez déjà un compte? ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "Connectez-vous",
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
