import 'package:flutter/material.dart';

Color myBlue = Color.fromRGBO(0, 57, 145, 1);
const MaterialColor primaryBlue = MaterialColor(
  bluePrimaryValue,
  <int, Color>{
    50: Color(0xFF003991),
    100: Color(0xFF003991),
    200: Color(0xFF003991),
    300: Color(0xFF003991),
    400: Color(0xFF003991),
    500: Color(bluePrimaryValue),
    600: Color(0xFF003991),
    700: Color(0xFF003991),
    800: Color(0xFF003991),
    900: Color(0xFF003991),
  },
);
const int bluePrimaryValue = 0xFF003991;

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
const systemError = SnackBar(
  backgroundColor: Colors.red,
  content: Text(
    "Une erreur inattendue est survenue. Veillez réessayer.",
    style: TextStyle(
        color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w400),
    textAlign: TextAlign.left,
    textScaleFactor: 1.1,
  ),
);
