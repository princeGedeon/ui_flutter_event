import 'package:flutter/material.dart';
import 'package:ui_event_app/components/wrapperprofile.dart';
import 'package:ui_event_app/screens/profilePage.dart';
import 'package:ui_event_app/screens/susbcription.dart';
import 'package:ui_event_app/utils/app_func.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return WrapperProfile(
      child: Column(
        children: [
          SizedBox(height: 100,),
          ElevatedButton(onPressed: (){
            navigateToNextPage(context, ProfilePage());
          },
            child: Text("COMPLETER VOTRE PROFIL" ,style: TextStyle(color: Colors.black,fontWeight:FontWeight.w700,fontSize:20 ),
            ),
            style: ElevatedButton.styleFrom(minimumSize: Size(300, 50),primary: Colors.white,shape: RoundedRectangleBorder(side: BorderSide(width: 1),borderRadius: BorderRadius.circular(10)),),
          ),
          SizedBox(height: 45,),
          ElevatedButton(onPressed: (){},
            child: Text("MODIFIER VOTRE PROFIL" ,style: TextStyle(color: Colors.black,fontWeight:FontWeight.w700,fontSize:20 ),
            ),
            style: ElevatedButton.styleFrom(minimumSize: Size(300, 50),primary: Colors.white,shape: RoundedRectangleBorder(side: BorderSide(width: 1),borderRadius: BorderRadius.circular(10)),),
          ),
          SizedBox(height: 45,),
          ElevatedButton(onPressed: (){},
            child: Text("AJOUTER NUMERO" ,style: TextStyle(color: Colors.black,fontWeight:FontWeight.w700,fontSize:20 ),
            ),
            style: ElevatedButton.styleFrom(minimumSize: Size(300, 50),primary: Colors.white,shape: RoundedRectangleBorder(side: BorderSide(width: 1),borderRadius: BorderRadius.circular(10)),),
          ),
          SizedBox(height: 45,),
          ElevatedButton.icon(
            onPressed: (){
              navigateToNextPage(context, Susbcription());
            },
            label: Text("PASSER EN PREMIUM " ,style: TextStyle(color: Colors.black,fontWeight:FontWeight.w700,fontSize:20, ),
            ),
            icon: Icon(Icons.precision_manufacturing_outlined,size: 30,color:Colors.black,),
            style: ElevatedButton.styleFrom(minimumSize: Size(300, 50),primary: Colors.white,shape: RoundedRectangleBorder(side: BorderSide(width: 1),borderRadius: BorderRadius.circular(10)),),
          ),

        ],


      ),
    );
  }
}
