import 'package:flutter/material.dart';

import '../../components/input.dart';

class Update_profil extends StatelessWidget {
  const Update_profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 9,),
      Text("Mon profil",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 22),),
      SizedBox(height: 9,),
       Input(nom: "Nom d'utilisateur",icon: Icons.account_circle_outlined,inputType:TextInputType.text),
       Input(nom: "Profession",icon: null,inputType:TextInputType.text),
       Input(nom: "Age",icon: null,inputType:TextInputType.number),
       Input(nom: "Date de naissance",icon: null,inputType:TextInputType.datetime),
      Input(nom: "Tél ",icon: null,inputType:TextInputType.phone),
      SizedBox(height: 10,),
      ElevatedButton(onPressed: (){},
        child: Text("MODIFIER INFORMATION",style: TextStyle(color: Colors.black),
        ),

        style: ElevatedButton.styleFrom(minimumSize:Size(250, 50) ,primary: Colors.white, elevation:1 ,shape: RoundedRectangleBorder(side:BorderSide(width:1 ,), borderRadius: BorderRadius.circular(5))),

      ),
    ],
    );
  }
}
