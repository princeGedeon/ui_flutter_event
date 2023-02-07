import 'package:flutter/material.dart';
import 'package:ui_event_app/screens/optionsPage.dart';
import 'package:ui_event_app/utils/app_func.dart';

import 'global.dart';

class WrapperEvent extends StatelessWidget {
  WrapperEvent({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: getSize(context).width,
        height: getSize(context).height,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            color: myBlue),
        child: Column(
          children: [
            SizedBox(
              height: getSize(context).height * 0.15,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Icon(
                              Icons.notifications,
                              size: 40,
                              color: Colors.white,
                            ),
                            CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.redAccent,
                              child: Text(
                                "12",
                                style: TextStyle(fontSize: 8),
                              ),
                            )
                          ],
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: const Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          navigateToNextPage(context, OptionsPage());
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                color: Colors.white,
              ),
              width: getSize(context).width,
              child: Padding(
                padding: EdgeInsets.only(top: 20, right: 10, left: 10),
                child: child,
              ),
            ))
          ],
        ),
      )),
    );
  }
}
