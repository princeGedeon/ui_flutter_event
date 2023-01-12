import 'package:flutter/material.dart';

class WrapperProfile extends StatefulWidget {
  WrapperProfile({Key? key,required this.child}) : super(key: key);
  Widget child;

  @override
  State<WrapperProfile> createState() => _WrapperProfileState();
}

class _WrapperProfileState extends State<WrapperProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),

      body: Container(
      child:Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          widget.child,

          Container(
            width: double.infinity,
            height: 100,
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                TextButton(onPressed: (){}, child: Text("Se déconnecter"))
              ],
            ),
          )
        ],
      )


      )


    );
  }
}

AppBar customAppBar(){
  return AppBar(
    title: Text("PrinceGedeon"),
    toolbarHeight: 100,
  );
}
