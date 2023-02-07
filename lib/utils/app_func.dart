import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:intl/intl.dart';

DateTime convertDate(dateString){
  var dateTime = DateTime.parse(dateString);
  return dateTime;
}

String formarDate(dateTime){
  var format = DateFormat("EEEE dd MMMM yyyy");
  var formattedDate = format.format(dateTime);
  return formattedDate;
}
log(dynamic text){
  if (kDebugMode) {
    print(text);
  }
}

Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

navigateToNextPage(BuildContext context, Widget widget,
    {bool back = true, bool remove = false}) {
  if (back) {
    if (remove) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => widget), (_) => false);
    } else {}
  } else {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }
}

showFlushBar(BuildContext context, String title, String message) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.black.withOpacity(0.85),
    duration: const Duration(seconds: 3),
    borderRadius: BorderRadius.circular(5),
    titleText: Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
    messageText: Text(
      message,
      style: const TextStyle(
          fontSize: 16.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
  ).show(context);
}

void showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          child: SizedBox(
            width: 40,
            height: 60,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      });
}

Center errorLoading(err, stack) {
  log(err);
  log(stack);
  return const Center(
      child: Text("Une erreur s'est produite pendant le chargement...."));
}

Center loadingError() {
  return const Center(
    child: CupertinoActivityIndicator(),
  );
}
