import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {

  String text;
  bool obscureText = false;
  TextEditingController? controller;

  CustomTextField({ Key? key,
  required this.obscureText, 
  required this.text,
  this.controller,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(text),

      ),
      obscureText: obscureText,
      controller: controller,
    );
  }
}