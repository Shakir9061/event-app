import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/teacher/studentlist.dart';



class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var name=TextEditingController();
  var department=TextEditingController();
  var phone=TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController();
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Center(child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text('Registration',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                )),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40,left: 30),
                      child: Text('Name',style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Field cannot be empty';
                        }
                      },
                      controller: name,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                 Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 30),
                      child: Text('Department',style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextFormField(
                        validator: (value) {
                        if(value!.isEmpty){
                          return 'Field cannot be empty';
                        }
                      },
                      controller: department,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                 Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 30),
                      child: Text('Phone No',style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextFormField(
                        validator: (value) {
                        if(value!.isEmpty){
                          return 'Field cannot be empty';
                        }
                      },
                      controller: phone,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                 Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 30),
                      child: Text('Email',style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextFormField(
                        validator: (value) {
                        if(value!.isEmpty){
                          return 'Field cannot be empty';
                        }
                      },
                      controller: email,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                 Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 30),
                      child: Text('Password',style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextFormField(
                        validator: (value) {
                        if(value!.isEmpty){
                          return 'Field cannot be empty';
                        }
                      },
                      controller: password,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220),
                  child: InkWell(
                    onTap: () async{
                     if(formkey.currentState?.validate()??false) {
                      UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
                      if(userCredential.user!=null){
                        await FirebaseFirestore.instance.collection('Teacher data').doc(userCredential.user!.uid).set({
                          'name':name.text,
                          'department':department.text,
                          'phone no':phone.text,
                          'email':email.text,
                          'passwoed':password.text
                        
                        });
                      }
                                                                                Navigator.push(context, MaterialPageRoute(builder: (context) => Student_List(),));
          
                     }
                    },
                    child: Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(color: Color(0xFF3063A5),borderRadius: BorderRadius.circular(7)),
                      child: Center(child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 15),)),
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