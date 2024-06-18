import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/editprofile.dart';
import 'package:flutter_application_1/student/upcoming.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profilestd extends StatefulWidget {
  Profilestd({super.key});

  @override
  State<Profilestd> createState() => _ProfilestdState();
}

class _ProfilestdState extends State<Profilestd> {
  final TextEditingController name = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  String? imageurl;
  String? uid;
  bool isLoading = true; // State variable for loading

  Future<void> setuserdetails() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      uid = prefs.getString('stdid');
      print('student id:$uid');
      if (uid!.isNotEmpty) {
        Stream<DocumentSnapshot> studentstream = FirebaseFirestore.instance
            .collection('student data')
            .doc(uid)
            .snapshots();
        studentstream.listen((studentsnapshot) async {
          if (studentsnapshot.exists) {
            setState(() {
              name.clear();
              department.clear();
              phonenumber.clear();
              email.clear();
              name.text = studentsnapshot['name'] ?? '';
              department.text = studentsnapshot['department'] ?? '';
              phonenumber.text = studentsnapshot['phone no'] ?? '';
              email.text = studentsnapshot['email'] ?? '';
              imageurl = studentsnapshot['imageurl'] ?? '';
             
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
        title: Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        // automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => UpcomingStd(),));
        //   },
        //   icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
       
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                      ),
                    ),
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
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 30),
                          child: Text(
                            'Name',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SizedBox(
                        width: 350,
                        child: TextFormField(
                          readOnly: true,
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
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SizedBox(
                        width: 350,
                        child: TextFormField(
                          readOnly: true,
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
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SizedBox(
                        width: 350,
                        child: TextFormField(
                          readOnly: true,
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
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SizedBox(
                        width: 350,
                        child: TextFormField(
                          readOnly: true,
                          controller: email,
                          decoration: InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 140),
                      child: InkWell(
                        onTap: () async {
                          setuserdetails();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Color(0xFF3063A5),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: Text(
                              'Edit',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
