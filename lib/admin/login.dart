import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/demo.dart';
import 'package:flutter_application_1/admin/request.dart';

class Login extends StatefulWidget {
  const Login({super.key});


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkkey=GlobalKey<FormState>();
  var email=TextEditingController();
  var password=TextEditingController();
  Future<void>adminlogin()async{
    if(formkkey.currentState!.validate()){
      try {
        String emailcontroller=email.text.trim();
        String passwordcontroller=password.text.trim();
        var querySnapshot=await FirebaseFirestore.instance.collection('admin login').where('email',isEqualTo: emailcontroller).limit(1).get();
        if(querySnapshot.docs.isNotEmpty){
          var admin_data =querySnapshot.docs.first.data();
          if(admin_data['password']==passwordcontroller){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Request(),));
          }
        }
      } catch (e) {
        
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Form(
              key: formkkey,
              child: Container(
                        height: 300,
                        width: 300,
                        color: Colors.blue[100],
                        child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 22,color: Color(0xFF3063A5),),
                ),
                SizedBox(
                   
                    width: 250,
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'please enter username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person), hintText: 'Username'),
                          
                    )),
                SizedBox(
                   
                    width: 250,
                    child: TextFormField(
                      controller: password,
                       validator: (value) {
                        if(value!.isEmpty){
                          return 'please enter password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: 'Password'),
                    )),
                InkWell(
                onTap: () {
                  adminlogin();
                },
                  child: Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Color(0xFF3063A5),
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                        child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
                  ),
                )
              ],
                        ),
                      ),
            )),
      ),
    );
  }
}
