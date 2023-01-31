
import 'package:flutter/material.dart';


import 'package:ui_event_app/screens/signin_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    const appTitle = 'Form Validation Demo';

    return const MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: SignInPage()
      ),
    );

  }
}

