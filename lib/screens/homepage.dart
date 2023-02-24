import 'package:flutter/material.dart';
import 'package:ui_event_app/components/wrapperevent.dart';
import 'package:ui_event_app/services/apiServices.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    ApiServices.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return WrapperEvent(child: Text("Heelo"));
  }
}
