import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {

  String text;
  bool obscureText = false;
  TextEditingController? controller;
  IconButton? suffixIcon;
  CustomTextField({ Key? key,
  required this.obscureText, 
  required this.text,
  this.controller,
  this. suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(text),
        suffixIcon: suffixIcon
      ),
      obscureText: obscureText,
      controller: controller,
      
    );
  }
}