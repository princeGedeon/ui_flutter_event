import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_event_app/screens/event_list.dart';

import 'package:ui_event_app/screens/signin_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? connected;

  init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      connected = prefs.getBool("connected");
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: (connected != true) ? SignInPage() : EventList()),
    );
  }
}
