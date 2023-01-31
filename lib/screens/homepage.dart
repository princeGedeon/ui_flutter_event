import 'package:flutter/material.dart';
import 'package:ui_event_app/components/wrapperevent.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WrapperEvent(child: Text("Heelo"));
  }
}
