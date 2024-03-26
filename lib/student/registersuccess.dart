import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterSuccess extends StatefulWidget {
  const RegisterSuccess({super.key});

  @override
  State<RegisterSuccess> createState() => _RegisterSuccessState();
}

class _RegisterSuccessState extends State<RegisterSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
                
                children: [
          Padding(
            padding: const EdgeInsets.only(top: 230.0),
            child: Center(
              child: Image(
                  height: 160, width: 160, image: AssetImage('images/success.png')),
            ),
          ),
          Text('Thank you!',
              style: TextStyle(
                fontSize: 30,
                color: Color.fromRGBO(52, 182, 39, 1),
              )),
          Text('Registration is Successfull',
              style: TextStyle(
                fontSize: 25,
              )),
               Padding(
                 padding: const EdgeInsets.only(top: 300),
                 child: InkWell(
                   onTap: () {
                     Navigator.pop(context);
                   },
                   child: Container(
                     height: 50,
                     width: 350,
                     decoration: BoxDecoration(color: Color(0xFF3063A5),borderRadius: BorderRadius.circular(7)),
                     child: Center(child: Text('Done',style: TextStyle(color: Colors.white,fontSize: 15),)),
                   ),
                 ),
               )
                ],
              ),
        ));
  }
}
