import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/Event.dart';
import 'package:flutter_application_1/student/regstudent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signinstudent extends StatefulWidget {
  const Signinstudent({super.key});

  @override
  State<Signinstudent> createState() => _SigninstudentState();
}

class _SigninstudentState extends State<Signinstudent> {
  final formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  Future<void> studentsignin() async {
    if (formkey.currentState!.validate()) {
      String email = emailcontroller.text.trim();
      String password = passwordcontroller.text.trim();
      var querySnapshot = await FirebaseFirestore.instance
          .collection('student data')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data();
        if (userData['password'] == password) {
          var storeId = userData['stdid'];
          if (storeId != null) {
            SharedPreferences pref = await SharedPreferences.getInstance();
            await pref.setString('stdid', storeId);
          }
          SharedPreferences pref = await SharedPreferences.getInstance();
          String? stdid = pref.getString('stdid');
          print('student id:$stdid');

          emailcontroller.clear();
          passwordcontroller.clear();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Event1(),
              ));
          Fluttertoast.showToast(
            msg: 'Succesfully loggined',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          print('incorrect password');
          Fluttertoast.showToast(
            msg: 'Incorrect Password',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } else {
        print('User not Fount');
        Fluttertoast.showToast(
          msg: 'User Not Found',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Sign in',
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Sign into your account',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 350,
                  child: TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'field cannot be empty';
                      }
                    },
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'field cannot be empty';
                      }
                    },
                    controller: passwordcontroller,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: InkWell(
                  onTap: ()  {
                    studentsignin();
                  },
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Color(0xFF3063A5),
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                        child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Regstudent(),
                            ));
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
