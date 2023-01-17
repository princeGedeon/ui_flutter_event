import 'package:flutter/material.dart';
import 'package:ui_event_app/components/wrapperprofile.dart';
import 'package:ui_event_app/screens/paiementPage.dart';
import 'package:ui_event_app/utils/app_func.dart';



class Susbcription extends StatefulWidget {
  const Susbcription({Key? key}) : super(key: key);

  @override
  State<Susbcription> createState() => _SusbcriptionState();
}

class _SusbcriptionState extends State<Susbcription> {
  @override
  Widget build(BuildContext context) {
    return WrapperProfile(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){
            navigateToNextPage(context,PaiementPage());
          },
              style: ElevatedButton.styleFrom(primary: Colors.white,shape: RoundedRectangleBorder(side: BorderSide(width: 1),borderRadius: BorderRadius.circular(10)),),

              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text("Abonnement Premium 1 mois",style: TextStyle(fontSize: 24,color: Colors.black),),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      SizedBox(width: 25,),
                      Text("10.000f",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.black),),
                      SizedBox(width: 205,),
                      Icon(Icons.ac_unit_sharp,color:Colors.amber ,),
                      SizedBox(height: 55,),
                    ],

                  ),

                ],
              )),
          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(primary: Colors.white,shape: RoundedRectangleBorder(side: BorderSide(width: 1),borderRadius: BorderRadius.circular(10)),),

              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text("Abonnement Premium 2 mois",style: TextStyle(fontSize: 24,color: Colors.black),),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      SizedBox(width: 25,),
                      Text("20.000f",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.black),),
                      SizedBox(width: 205,),
                      Icon(Icons.ac_unit_sharp,color:Colors.amber ,),
                      SizedBox(height: 55,),
                    ],

                  ),

                ],
              )),
          SizedBox(height: 145,),
        ],
      ),

    ));
  }
}
