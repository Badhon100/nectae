// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nectar/screens/login_screen.dart';
import 'package:nectar/screens/widgets/custom_button.dart';
import 'package:nectar/screens/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

TextEditingController? userName = TextEditingController();
 TextEditingController email = TextEditingController();
 TextEditingController password = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var currentFocus;
  @override
  Widget build(BuildContext context) {



    return GestureDetector(
      onTap: (){
        currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/logo_background.png"),
                      fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Image.asset("assets/img/logo_orange.png"),
                    ),
                  )
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const Text(
                          "Enter your credencial to continue",
                          style: TextStyle(
                            color: Colors.black38
                          ),
                        ),
                          ],
                        ),
                        
                        SizedBox(
                          height: 80,
                          width: 350,
                          child: CustomTextField(
                            obscureText: false, 
                            text: "Username",
                            controller: userName,),
                            
                        ),
                        SizedBox(
                          height: 80,
                          width: 350,
                          child: CustomTextField(
                            obscureText: false, 
                            text: "E-mail",
                            controller: email,
                            )
                        ),
                        SizedBox(
                          height: 80,
                          width: 350,
                          child: CustomTextField(
                            obscureText: true, 
                            text: "Password",
                            controller: password,
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Wrap(
                            spacing: 5,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "By continuing you are agree to our"
                                  ),
                                  TextButton(
                                  child: const Text("Terms of service", style: TextStyle(color: Color(0xFF53B175)),),
                                  onPressed: (){},
                                ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "and"
                                  ),
                                  TextButton(
                                  child: const Text("Privacy Policy", style: TextStyle(color: Color(0xFF53B175)),),
                                  onPressed: (){},
                                ),
                                ],
                              )
                            ],
                          ),
                        ),
                        CustomButton(
                          text: "Sign Up",
                          onPressed: (){},
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?", style: TextStyle(color: Colors.black),),
                          TextButton(
                            child: const Text("Login",),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                            },
                          ),
                        ],
                      ),
                      ],
                    ),
                  )
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}

