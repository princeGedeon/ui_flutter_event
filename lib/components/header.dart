import 'package:flutter/material.dart';

import '../constants/constant.dart';




class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,

      child: Container(
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 6.0),
          child:Container()
        ),
        color: Colors.indigo,

      ),

    );
  }
}
