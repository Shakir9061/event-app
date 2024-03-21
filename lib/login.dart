import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(child: Container(
          height: 300,
          width: 300,
          color: Colors.blue[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Login',style: TextStyle(fontSize: 20),),
              SizedBox(
                height: 50,
                width: 180,
                child: TextFormField(

                )),
                  SizedBox(
                height: 50,
                width: 180,
                child: TextFormField(

                )),
                Container(
                  height: 40,
                  width: 150,
                  color: Color(0xFF3063A5),
                  child: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 15),)),
                )
            ],
          ),
        )),
      ),

    );
  }
}