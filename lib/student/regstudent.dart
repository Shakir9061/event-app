import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/student/Event.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Regstudent extends StatefulWidget {
  const Regstudent({super.key});

  @override
  State<Regstudent> createState() => _RegstudentState();
}

class _RegstudentState extends State<Regstudent> {
  final TextEditingController regname = TextEditingController();
  final TextEditingController regdepartment = TextEditingController();
  final TextEditingController regphonenumber = TextEditingController();
  final TextEditingController regemail = TextEditingController();
  final TextEditingController regpassword = TextEditingController();
  final formkey = GlobalKey<FormState>();
  Future<void> registrationdetails() async {
    if (formkey.currentState?.validate() ?? false) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: regemail.text, password: regpassword.text);
        String studentuid = userCredential.user!.uid;
     
          await FirebaseFirestore.instance
              .collection('student data')
              .doc(studentuid)
              .set({
            'name': regname.text,
            'department': regdepartment.text,
            'phone no': regphonenumber.text,
            'email': regemail.text,
            'password': regpassword.text,
            'stdid': studentuid,
          });
                  Fluttertoast.showToast(msg: "regisration succussfully");


        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Event1(),
            ));
      }on FirebaseAuthException catch (e) {
        print('Failed to register user: $e');
        String errorMessage = "Registration failed. ${e.message}";

        if (e.code == "email-already-in-use") {
          errorMessage =
              "Email is already in use. Please use a different email";
        }
        Fluttertoast.showToast(
          msg: errorMessage,
        );
      }
      
       catch (e) {
        print('Unexpected error during registration: $e');
        Fluttertoast.showToast(
          msg: "Unexpected error during registration",
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
                      controller: regname,
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
                      controller: regdepartment,
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
                      controller: regphonenumber,
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
                      controller: regemail,
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
                      controller: regpassword,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220),
                  child: InkWell(
                    onTap: ()  {
                      registrationdetails();
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
