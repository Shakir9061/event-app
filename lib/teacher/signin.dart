import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/teacher/registration.dart';
import 'package:flutter_application_1/teacher/studentlist.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text('Sign in',style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text('Sign into your account',style: TextStyle(fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: SizedBox(
                height: 50,
                width: 350,
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Email Address'),
                ),
              ),
            ),
          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Center(
                                  child: SizedBox(
                                    height: 50,
                                    width: 350,
                                    child: TextFormField(
                                      decoration: InputDecoration(hintText: 'Password'),
                                    ),
                                  ),
                                ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Student_List(),));

                          },
                          child: Container(
                            height: 50,
                            width:350 ,
                            decoration: BoxDecoration(color: Color(0xFF3063A5),borderRadius: BorderRadius.circular(7)),
                            child: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 15),)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don’t have an account? '),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Registration(),));
                            },
                            child: Text('Sign up',style: TextStyle(color: Colors.blue),))
                      
                        ],
                      ),
                    ),
                    
        ],
      )) ,
    );
  }
}