// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nectar/screens/home_page.dart';
import 'package:nectar/screens/sign_up._screen.dart';
import 'package:nectar/screens/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

 
  // ignore: prefer_typing_uninitialized_variables
  var currentFocus;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool iconStatus = false;

  login()async{
    try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email.text,
    password: password.text
  );
  var authCredencial = userCredential.user;
  if(authCredencial!.uid.isNotEmpty){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
  }
  else{
    Fluttertoast.showToast(msg: 'Something went wrong');
  }
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    Fluttertoast.showToast(msg: 'No user found for that email.', );
  } else if (e.code == 'wrong-password') {
    Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
  }
}
  }

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
                              controller: email,
                            )
                          ),
                          SizedBox(
                            height: 80.h,
                            width: 350.w,
                            child: CustomTextField(
                              obscureText: (iconStatus == false)?true:false, 
                              text: "Password",
                              controller: password,
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
                              onPressed: (){
                                login();
                              },
                            ),
                          ),
                          ElevatedButton(onPressed: () => login(), child: const Text("login")),
                          // CustomButton(onPressed: (){}, text: "Login"),
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