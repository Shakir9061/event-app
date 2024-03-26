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
                    height: 50,
                    width: 180,
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'please enter username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person), hintText: 'Username'),
                          
                    )),
                SizedBox(
                    height: 50,
                    width: 180,
                    child: TextFormField(
                       validator: (value) {
                        if(value!.isEmpty){
                          return 'please enter username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: 'Password'),
                    )),
                InkWell(
                  onTap: () {
                    if(formkkey.currentState?.validate()??false){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Request(),));
                    }
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
