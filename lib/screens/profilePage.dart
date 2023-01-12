import 'package:flutter/material.dart';
import 'package:ui_event_app/components/wrapperprofile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  WrapperProfile(child: Center(child: Text("Hi"),));
  }
}
