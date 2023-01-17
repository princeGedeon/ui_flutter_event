import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui_event_app/components/global.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscuretext = false;
  bool _checkValue = true;
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
                bottomLeft: Radius.circular(65),
                bottomRight: Radius.circular(65))),
        title: Center(child: Text("Se connecter")),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth / 30),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    label: Text("Adresse mail"),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail_outlined)),
              ),
              TextFormField(
                obscureText: _obscuretext,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscuretext = !_obscuretext;
                          });
                        },
                        icon: Icon(Icons.visibility_outlined)),
                    label: Text("Mot de passe"),
                    prefixIcon: Icon(Icons.lock_outline)),
              ),
              /* Row(
                  children: [
                    CheckboxListTile(
                      value: _checkValue,
                      onChanged: (value) {
                        _checkValue = value!;
                      },
                      title: Text("Se souvenir"),
                    )
                  ],
                ) */
            ],
          ),
        ),
      ),
    );
  }
}
