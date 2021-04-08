import 'package:flutter/material.dart';


class Otp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Column(
           children: [
             TextField()
           ],

        ),
        SizedBox(width: 10,),
         Column(
           children: [
             TextField()
           ],

        )
      ],),
    );
  }
}