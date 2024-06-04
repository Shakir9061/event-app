import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/Event.dart';
import 'package:flutter_application_1/student/profilestd.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  File? image;
  EditProfile({super.key, this.image});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var name = TextEditingController();
  var department = TextEditingController();
  var phonenumber = TextEditingController();
  var email = TextEditingController();
  Future<void> setuserdetails() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? uid = pref.getString('stdid');
      print('student id:$uid');
      if (uid!.isNotEmpty) {
        Stream<DocumentSnapshot> studentstream = FirebaseFirestore.instance
            .collection('student data')
            .doc(uid)
            .snapshots();
        studentstream.listen((studentsnapshot) {
          if (studentsnapshot.exists) {
            setState(() {
              name.text = studentsnapshot['name'] ?? '';
              department.text = studentsnapshot['department'] ?? '';
              phonenumber.text = studentsnapshot['phone no'] ?? '';
              email.text = studentsnapshot['email'] ?? '';
            });
          }
        });
      }
    } catch (e) {
      print('error fetching student details:$e');
    }
  }

  void initState() {
    super.initState();
    setuserdetails();
  }

  Future<void> updateuserdetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? uid = pref.getString('stdid');
    if (uid != null) {
      await FirebaseFirestore.instance
          .collection('student data')
          .doc(uid)
          .update({
        'name': name.text,
        'department': department.text,
        'phone no': phonenumber.text,
        'email': email.text
      });
      await pref.setString('name', name.text);
      await pref.setString('department', department.text);
      await pref.setString('phone no', phonenumber.text);
      await pref.setString('email', email.text);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Profile updated')));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Event1(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profilestd(),
                  ));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      widget.image != null ? FileImage(widget.image!) : null,
                  child: widget.image == null ? Icon(Icons.person) : null,
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
                    controller: email,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140),
                child: InkWell(
                  onTap: () async {
                    updateuserdetails();
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
    );
  }
}
