import 'package:flutter/material.dart';
import 'package:ui_event_app/screens/signin_page.dart';
import 'package:ui_event_app/utils/app_func.dart';
import '../constants/constant.dart';
class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
      child: Column(
     crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 2,
            width: double.maxFinite,
            color: Colors.black45,

          ),
          SizedBox(
            height: 8,
          ),
          TextButton(onPressed: (){

            navigateToNextPage(context, SignInPage());

          },
              child: Text("Se déconnecter", style: TextStyle(color:Colors.black,fontSize:18 ),textAlign: TextAlign.right,)
          )
        ],
      ),
    );
  }
}
