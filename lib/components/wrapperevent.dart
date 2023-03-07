import 'package:flutter/material.dart';
import 'package:ui_event_app/constants/constant.dart';
import 'package:ui_event_app/screens/createEvent.dart';
import 'package:ui_event_app/screens/event_list.dart';
import 'package:ui_event_app/screens/optionsPage.dart';
import 'package:ui_event_app/services/apiServices.dart';
import 'package:ui_event_app/utils/app_func.dart';

import 'global.dart';

class WrapperEvent extends StatefulWidget {
  bool floatingButton = true;
  WrapperEvent({Key? key, required this.child, required this.floatingButton})
      : super(key: key);
  final Widget child;

  @override
  State<WrapperEvent> createState() => _WrapperEventState();
}

class _WrapperEventState extends State<WrapperEvent> {
  bool account_loading = false;
  bool add_loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: (widget.floatingButton)
          ? (userData[4] != "STANDART")
              ? FloatingActionButton(
                  backgroundColor: myBlue,
                  onPressed: () {
                    setState(() {
                      add_loading = true;
                    });
                    ApiServices.getUser();
                    setState(() {
                      add_loading = false;
                    });
                    navigateToNextPage(context, CreateEventPage());
                  },
                  child: (!add_loading)
                      ? Icon(Icons.add)
                      : CircularProgressIndicator(),
                )
              : Container()
          : Container(),
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
                              Icons.home,
                              size: 40,
                              color: Colors.white,
                            ),
                            CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.redAccent,
                              child: Text(
                                "",
                                style: TextStyle(fontSize: 8),
                              ),
                            )
                          ],
                        ),
                        onPressed: () {
                          navigateToNextPage(context, EventList(), back: false);
                        }),
                    IconButton(
                        icon: (!account_loading)
                            ? const Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.white,
                              )
                            : CircularProgressIndicator(),
                        onPressed: () async {
                          setState(() {
                            account_loading = true;
                          });
                          ApiServices.getUser().then((value) {
                            setState(() {
                              account_loading = false;
                              print("fin du loader");
                            });
                            navigateToNextPage(context, OptionsPage());
                          });
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
                child: widget.child,
              ),
            ))
          ],
        ),
      )),
    );
  }
}
