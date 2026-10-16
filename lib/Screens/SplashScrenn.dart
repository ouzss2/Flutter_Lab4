import 'package:flutter/material.dart';
import 'package:lab4_glsib/Screens/LoginScreen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3),()async{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
    });
    // TODO: implement build
   return Scaffold(
    body: Center(
      child: Lottie.asset("animations/loading.json"),
    ),
   );
  }
}