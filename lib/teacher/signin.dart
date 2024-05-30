import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/teacher/registration.dart';
import 'package:flutter_application_1/teacher/studentlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Future<void> _savedata(String storeId) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('data', storeId);
    }

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
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'field cannot be empty';
                      }
                    },
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: InkWell(
                  onTap: () async {
                    if (formkey.currentState?.validate() ?? false) {
                      String email = emailcontroller.text.trim();
                      String password = passwordcontroller.text.trim();
                      var querySnapshot = await FirebaseFirestore.instance
                          .collection('Teacher data')
                          .where('email', isEqualTo: email)
                          .limit(1)
                          .get();
                      if (querySnapshot.docs.isNotEmpty) {
                        var userData = querySnapshot.docs.first.data();
                        if (userData['passwoed'] == password) {
                          var storeId = userData['data'] as String?;
                          if (storeId != null) {
                            await _savedata(storeId);
                          }
                           Fluttertoast.showToast(
                                msg: 'Succesfully loggined',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                          
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Student_List(),
                              ));
                              
                              
                        }
                      }
                    }
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
                              builder: (context) => Registration(),
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
