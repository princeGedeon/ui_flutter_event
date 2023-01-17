import 'package:flutter/material.dart';
import 'package:ui_event_app/components/wrapperprofile.dart';

import '../components/input.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  WrapperProfile(child: Center(child: Container(
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 35,),
          Input(nom: "Nom",icon:null,inputType:TextInputType.text),
          Input(nom: "Prénom",icon: null,inputType:TextInputType.text),
          Input(nom: "Code postal",icon: null,inputType:TextInputType.number),
          Input(nom: "Numéro bancaire",icon: null,inputType:TextInputType.number),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){},
            child: Text("PAYMENT",style: TextStyle(color: Colors.white,fontSize:30 ),
            ),

            style: ElevatedButton.styleFrom(minimumSize:Size(250, 50) ,primary: Colors.greenAccent, elevation:1 ,shape: RoundedRectangleBorder(side:BorderSide(width:0 ,), borderRadius: BorderRadius.circular(10))),

          ),
          SizedBox(height: 90,),
        ],
      )
    ),));
  }
}
