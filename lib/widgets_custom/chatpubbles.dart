import 'package:flutter/material.dart';
import 'package:mu7achatapp/models/massges.dart';

class Chatpubbles extends StatelessWidget {
  const Chatpubbles({
    Key? key,required this.message
  }) : super(key: key);
 final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
         margin: EdgeInsets.symmetric(horizontal:16 , vertical: 9),
         padding: EdgeInsets.only(top: 30 ,left: 16 , bottom: 30 , right: 16),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(32),
             topRight: Radius.circular(32),
             bottomRight: Radius.circular(32),
           ),
           color: Colors.black,
         ),
         child: Text(
           message.message,
           style: TextStyle(color: Colors.white),
         ),
       ),
    );
  }
}

class Chatpubblesforfriend extends StatelessWidget {
  const Chatpubblesforfriend({
    Key? key,required this.message
  }) : super(key: key);
 final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
         margin: EdgeInsets.symmetric(horizontal:16 , vertical: 9),
         padding: EdgeInsets.only(top: 30 ,left: 16 , bottom: 30 , right: 16),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(32),
             topRight: Radius.circular(32),
             bottomLeft: Radius.circular(32),
           ),
           color: Colors.orange,
         ),
         child: Text(
           message.message,
           style: TextStyle(color: Colors.white),
         ),
       ),
    );
  }
}