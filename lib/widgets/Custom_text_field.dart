// ignore_for_file: prefer_const_constructors, must_be_immutable, file_names

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hintText, this.onchange, this.obscureText = false});
  Function(String)? onchange;
  String? hintText;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: obscureText!,
      // ignore: body_might_complete_normally_nullable
      validator: (data) {
        if (data!.isEmpty) {
          return 'Invalid ';
        }
      },
      onChanged: onchange,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.white,
          )),
    );
  }
}
