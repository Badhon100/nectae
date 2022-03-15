import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/img/login_background.png"),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text("Get your groceries"),
                Text("with nectar"),
              ],
            )
          ]
          ),
      ),
    );
  }
}