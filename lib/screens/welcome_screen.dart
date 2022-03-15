import 'package:flutter/material.dart';
import 'package:nectar/screens/home_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/welcome_background.png",),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom:50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 30,),
                Image.asset("assets/img/logo.png"),
                const SizedBox(height: 25,),
                const Text("Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
    
                  ),
                ),
                const SizedBox(height: 5,),
                const Text("to our Store",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
    
                  ),
                ),
                const SizedBox(height: 5,),
                const Text("Get your groceries in as fast as one hour",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
    
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                    }, 
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0)),
                      primary: const Color(0xFF53B175)
                    ),
                    child: const Text("Get started")
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}