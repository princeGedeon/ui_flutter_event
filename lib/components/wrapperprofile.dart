import 'package:flutter/material.dart';
import 'package:ui_event_app/constants/constants_api.dart';
import 'package:ui_event_app/utils/helper_preferences.dart';

import '../constants/constant.dart';
import 'footer.dart';
import 'global.dart';
import 'header.dart';

class WrapperProfile extends StatefulWidget {
  WrapperProfile({Key? key, required this.child}) : super(key: key);
  Widget child;

  @override
  State<WrapperProfile> createState() => _WrapperProfileState();
}

class _WrapperProfileState extends State<WrapperProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: ScrollConfiguration(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: widget.child,
                ),
                const Footer(),
              ],
            ),
          ),
          behavior: MyBehavior(),
        ),
      ),
    );
  }
}

AppBar customAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: myBlue,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Stack(
            children: [
              CircleAvatar(
                minRadius: 30,
                backgroundImage: NetworkImage(
                    APiConstants.BASEURL2 + userData[3],
                    scale: 0.3),
              ),
              (userData[4] != "STANDART")
                  ? (Positioned(
                      top: 70,
                      left: 60,
                      child: Icon(
                        Icons.workspace_premium,
                        color: Colors.yellow,
                        size: 35,
                      )))
                  : Container()
            ],
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userData[1] + " " + userData[2],
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Profil",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        )
      ],
    ),
    toolbarHeight: 160,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(65), bottomRight: Radius.circular(65))),
  );
}
