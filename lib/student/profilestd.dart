import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profilestd extends StatefulWidget {
  const Profilestd({super.key});

  @override
  State<Profilestd> createState() => _ProfilestdState();
}

class _ProfilestdState extends State<Profilestd> {
 final name = TextEditingController();
 final department = TextEditingController();
 final phonenumber = TextEditingController();
 final email = TextEditingController();
  void initState() {
    super.initState();
    setuserdetails();
  }
Future<void>setuserdetails()async{
SharedPreferences pref=await SharedPreferences.getInstance();
String? uid=pref.getString('uid');
if(uid!=null){
  DocumentSnapshot userdoc=await FirebaseFirestore.instance.collection('student data').doc(uid).get();
  setState(() {
  name.text=userdoc['name']??'';
    department.text=userdoc['department']??'';
    phonenumber.text=userdoc['phone']??'';
    email.text=userdoc['email']??'';
});
}

    
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Profile',style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
       body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Padding(
                padding: const EdgeInsets.only(top: 20),
               
              )),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image(
                  height: 100,
                  width: 100,
                  image: AssetImage('images/person.png')),
              ),
               Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 30),
                    child: Text('Name',style: TextStyle(fontSize: 14),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SizedBox(
                  height: 40,
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
                    padding: const EdgeInsets.only(top: 20,left: 30),
                    child: Text('Department',style: TextStyle(fontSize: 14),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SizedBox(
                  height: 40,
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
                    padding: const EdgeInsets.only(top: 20,left: 30),
                    child: Text('Phone No',style: TextStyle(fontSize: 14),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SizedBox(
                  height: 40,
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
                    padding: const EdgeInsets.only(top: 20,left: 30),
                    child: Text('Email',style: TextStyle(fontSize: 14),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SizedBox(
                  height: 40,
                  width: 350,
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(top: 140),
                child: InkWell(
                  onTap: () async{
                   setuserdetails();
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
    );
  }
}