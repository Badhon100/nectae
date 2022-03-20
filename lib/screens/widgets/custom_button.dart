import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {

  double width;
  double height;
  VoidCallback onPressed;
  double radius;
  Color? color = const Color(0xFF53B175);
  String text;

  CustomButton({
    this.width = 350,
    this.height = 50,
    required this.onPressed,
    this.radius = 13,
    this.color,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      onPressed: (){}, 
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius)),
        primary: color,
      ),
      child: const Text("Sign Up")
      ),
    );
  }
}