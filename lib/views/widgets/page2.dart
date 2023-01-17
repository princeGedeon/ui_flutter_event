import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100,),
        ElevatedButton(onPressed: (){},
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
          onPressed: (){},
          label: Text("PASSER EN PREMIUM " ,style: TextStyle(color: Colors.black,fontWeight:FontWeight.w700,fontSize:20, ),
          ),
          icon: Icon(Icons.precision_manufacturing_outlined,size: 30,color:Colors.black,),
          style: ElevatedButton.styleFrom(minimumSize: Size(300, 50),primary: Colors.white,shape: RoundedRectangleBorder(side: BorderSide(width: 1),borderRadius: BorderRadius.circular(10)),),
        ),

      ],


    );
  }
}
