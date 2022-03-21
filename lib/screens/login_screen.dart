// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/screens/sign_up._screen.dart';
import 'package:nectar/screens/widgets/custom_button.dart';
import 'package:nectar/screens/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

 
  // ignore: prefer_typing_uninitialized_variables
  var currentFocus;

  bool iconStatus = false;



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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 30.sp,
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
                            height: 80.h,
                            width: 350.w,
                            child: CustomTextField(
                              obscureText: false, 
                              text: "E-mail",
                            )
                          ),
                          SizedBox(
                            height: 80.h,
                            width: 350.w,
                            child: CustomTextField(
                              obscureText: (iconStatus == false)?true:false, 
                              text: "Password",
                              suffixIcon: IconButton(
                                icon: (iconStatus == false)?const Icon(Icons.visibility_off): const Icon(Icons.visibility), 
                                onPressed: (){
                                  setState(() {
                                    iconStatus = !iconStatus;
                                  });
                                },
                              )
                            )
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child:  TextButton(
                              child: const Text("Forgot Password?", style: TextStyle(color: Colors.black),),
                              onPressed: (){},
                            ),
                          ),
                          CustomButton(onPressed: (){}, text: "Login"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Dont have an account", style: TextStyle(color: Colors.black),),
                            TextButton(
                              child: const Text("SignUp",),
                              onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                            },
                            ),
                          ],
                        ),
                        ],
                      ),
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