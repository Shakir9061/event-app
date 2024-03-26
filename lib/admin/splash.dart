import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/Mainpage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override

  Widget build(BuildContext context) {
     Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    });
    return  Scaffold(
      backgroundColor:  Color(0xFF3063A5),
      body: Center(child: Text('ColleagueApp',style: TextStyle(color: Colors.white,fontSize: 35),)),
    );
  }
}