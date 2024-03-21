import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Color(0xFF3063A5),
      body: Center(child: Text('ColleagueApp',style: TextStyle(color: Colors.white,fontSize: 35),)),
    );
  }
}