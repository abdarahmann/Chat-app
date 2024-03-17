// ignore_for_file: prefer_const_constructors

import 'package:chatt_app/models/message_model.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class BubbleChat extends StatelessWidget {
  const BubbleChat({super.key, required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        padding: EdgeInsets.only(left: 13, right: 16, bottom: 30, top: 30),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25)),
        ),
        child: Text(
          messageModel.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class BubbleFriendChat extends StatelessWidget {
  const BubbleFriendChat({super.key, required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        padding: EdgeInsets.only(left: 13, right: 16, bottom: 30, top: 30),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 25, 59, 119),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        child: Text(
          messageModel.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
