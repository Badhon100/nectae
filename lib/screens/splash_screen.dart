import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar/screens/welcome_screen.dart';

class SplasfScreen extends StatefulWidget {
  const SplasfScreen({ Key? key }) : super(key: key);

  @override
  State<SplasfScreen> createState() => _SplasfScreenState();
}

class _SplasfScreenState extends State<SplasfScreen> {

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() async{
    Timer(const Duration(seconds:3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF53B175),
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/img/logo.png",
                height: 49.13,
                width: 43.13,
              ),
              const SizedBox(width: 10,),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("nectar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                    Text("online grocerist",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}