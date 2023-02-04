import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_event_app/components/global.dart';
import 'package:ui_event_app/screens/signin_page.dart';
import 'package:ui_event_app/services/apiServices.dart';
import 'package:ui_event_app/utils/app_func.dart';

class ForgottenPasswordPartTwo extends StatefulWidget {
  ForgottenPasswordPartTwo({super.key,required this.pass1,required this.pass2});
  final String pass1;
  final String pass2;




  @override
  State<ForgottenPasswordPartTwo> createState() =>
      _ForgottenPasswordPartTwoState();
}

class _ForgottenPasswordPartTwoState extends State<ForgottenPasswordPartTwo> {
  bool _obscuretext = true;
  bool _checkValue = true;
  late TextEditingController codeController;

  @override
  void initState() {
    // TODO: implement initState
    codeController=TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    codeController.dispose();
    super.dispose();
  }
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
                  controller: codeController,
                  keyboardType: TextInputType.text,decoration: InputDecoration(hintText: "Code de validation"),
                ),
                SizedBox(
                  height: screenHeight / 30,
                ),
                SizedBox(
                  height: screenHeight / 50,
                ),
                Center(
                  child: Text(
                    "Entrez le code secret",
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
                        onPressed: () async {
                          List<String> splitted = codeController.text.split("/");
                          print(splitted[0]);
                          print(splitted[1]);

                          if (await ApiServices.changepassword(widget.pass1, widget.pass2, splitted[1], splitted[0])){
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
                                      onPressed: () {
                                        navigateToNextPage(context, SignInPage());
                                      }),
                                ));
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(systemError);
                            codeController.text="";
                          }

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
