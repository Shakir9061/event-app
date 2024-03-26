import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
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
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220),
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(color: Color(0xFF3063A5),borderRadius: BorderRadius.circular(7)),
                child: Center(child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 15),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}