

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/editprofile.dart';
import 'package:flutter_application_1/teacher/editprofile.dart';
import 'package:flutter_application_1/teacher/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class teacherprofile extends StatefulWidget {
  const teacherprofile({super.key});

  @override
  State<teacherprofile> createState() => _teacherprofileState();
}

class _teacherprofileState extends State<teacherprofile> {
 final TextEditingController name = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
      String? imageurl;
  String? uid;
Future<void> setuserdetails() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      uid = prefs.getString('teacherid');
      print('teacher id:$uid');
      if (uid!.isNotEmpty) {
        Stream<DocumentSnapshot> teacherstream = FirebaseFirestore.instance
            .collection('Teacher data')
            .doc(uid)
            .snapshots();
        teacherstream.listen((teachersnapshot) async {
          if (teachersnapshot.exists) {
            setState(() {
              
              name.text = teachersnapshot['name'] ?? '';
              department.text = teachersnapshot['department'] ?? '';
              phone.text = teachersnapshot['phone no'] ?? '';
              email.text = teachersnapshot['email'] ?? '';
              imageurl = teachersnapshot['imageurl'] ?? '';
             
            });
          }
        });
      }
    } catch (e) {
      print('error fetching student details:$e');
     
    }
  }

  @override
  void initState() {
    super.initState();
    setuserdetails();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),) ,),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
             
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  radius: 50,
                   backgroundImage: imageurl != null && imageurl!.isNotEmpty
                              ? NetworkImage(imageurl!)
                              : null,
                          child: imageurl == null || imageurl!.isEmpty
                              ? Icon(Icons.person, size: 50)
                              : null,
                )
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
                 
                  width: 350,
                  child: TextFormField(
                    controller: phone,
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
                
                  width: 350,
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(top: 80),
                child: InkWell(
                  onTap: () {
                    setuserdetails();
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>teachereditprofile() ,));
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
