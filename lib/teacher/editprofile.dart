import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/teacher/profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class teachereditprofile extends StatefulWidget {
  const teachereditprofile({super.key});

  @override
  State<teachereditprofile> createState() => _teachereditprofileState();
}

class _teachereditprofileState extends State<teachereditprofile> {
  final TextEditingController name = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
     
 File? image;
  String? imageurl;

  Future<void> setuserdetails() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? uid = pref.getString('teacherid');
      print('teacher id:$uid');
      if (uid!.isNotEmpty) {
        Stream<DocumentSnapshot> teacherstream= FirebaseFirestore.instance
            .collection('Teacher data')
            .doc(uid)
            .snapshots();
        teacherstream.listen((teachersnapshot) {
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

  Future<void> updateuserdetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? uid = pref.getString('teacherid');
    if (uid != null) {
      await FirebaseFirestore.instance
          .collection('Teacher data')
          .doc(uid)
          .update({
        'name': name.text,
        'department': department.text,
        'phone no': phone.text,
        'email': email.text,
        'imageurl': imageurl ?? '',
      });
      await pref.setString('name', name.text);
      await pref.setString('department', department.text);
      await pref.setString('phone no', phone.text);
      await pref.setString('email', email.text);
      if (imageurl != null) {
        await pref.setString('imageurl', imageurl!);
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Profile updated')));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>teacherprofile(),
          ));
    }
  }

  Future<void> profileimg() async {
    if (image != null) {
      var ref = FirebaseStorage.instance
          .ref()
          .child('teacher profile image')
          .child(DateTime.now().millisecondsSinceEpoch.toString());
      await ref.putFile(image!);
      var imgurl = await ref.getDownloadURL();
      setState(() {
        imageurl = imgurl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text(' Edit Profile',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),) ,),
        body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
             
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () async {
                      var picked = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (picked != null) {
                        setState(() {
                          image = File(picked.path);
                        });
                      }
                    },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:image != null
                          ? FileImage(image!) as ImageProvider<Object>
                          : (imageurl != null && imageurl!.isNotEmpty)
                              ? NetworkImage(imageurl!)
                              : null,
                      child: image == null && (imageurl == null || imageurl!.isEmpty)
                          ? Icon(Icons.person, size: 50)
                          : null,
                  ),
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
                  onTap: ()async {
                 await profileimg();
                 await updateuserdetails();
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