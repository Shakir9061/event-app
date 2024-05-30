import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/student/Event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Regstudent extends StatefulWidget {
  const Regstudent({super.key});

  @override
  State<Regstudent> createState() => _RegstudentState();
}

class _RegstudentState extends State<Regstudent> {
  var name = TextEditingController();
  var department = TextEditingController();
  var phonenumber = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'Registration',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 30),
                      child: Text(
                        'Name',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        'Department',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextFormField(
                      controller: department,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        'Phone No',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextFormField(
                      controller: phonenumber,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        'Email',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        'Password',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextFormField(
                      controller: password,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220),
                  child: InkWell(
                    onTap: () async {
                      if (formkey.currentState?.validate() ?? false) {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                                email: email.text, password: password.text);
                                String uid=userCredential.user!.uid;
                        if (userCredential.user != null) {
                          await FirebaseFirestore.instance
                              .collection('student data')
                              .doc(uid)
                              .set({
                            'name': name.text,
                            'department': department.text,
                            'phone no': phonenumber.text,
                            'email': email.text,
                            'password': password.text
                          });
                          SharedPreferences pref=await SharedPreferences.getInstance();
                          await pref.setString('uid', uid);
                          await pref.setString('name', name.text);
                          await pref.setString('department', department.text);
                          await pref.setString('phone', phonenumber.text);
                          await pref.setString('email', email.text);
                          

                        }
                        
                        
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Event1(),
                            ));
                          

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
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                    ),
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
