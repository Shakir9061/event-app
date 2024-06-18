import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/photostd.dart';
import 'package:image_picker/image_picker.dart';

class Addphotostd extends StatefulWidget {
  const Addphotostd({super.key});

  @override
  State<Addphotostd> createState() => _AddphotostdState();
}

class _AddphotostdState extends State<Addphotostd> {
  XFile? pick;
  File? image;
  String? imageurl;
   Future<void> profileimg() async {
    if (image != null) {
      var ref = FirebaseStorage.instance
          .ref()
          .child('event photos')
          .child(DateTime.now().millisecondsSinceEpoch.toString());
      await ref.putFile(image!);
      var imgurl = await ref.getDownloadURL();
      setState(() {
        imageurl = imgurl;
      });
      await FirebaseFirestore.instance.collection('event_photos').add({
          'imageUrl': imageurl,
         
          'timestamp': FieldValue.serverTimestamp(),
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Photostd() ,));
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(children: [
            Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 110, left: 5),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios)),
                        ),
                        Text(
                          'Add Photo',
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )),
                   Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Text(
                        'Photo',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: InkWell(
                    onTap: () async{
                       var picked = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (picked != null) {
                      setState(() {
                        image = File(picked.path);
                      });
                    }
                    },
                    child: Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(width: 0.7)),
                          child:  image != null
                          ? Image.file(image!, fit: BoxFit.cover)
                          : (imageurl != null && imageurl!.isNotEmpty)
                              ? Image.network(imageurl!, fit: BoxFit.cover)
                              : Center(child: Text('Tap to select an image')),
                    ),
                  ),
                ),
                    Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 30),
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
              Padding(
              padding: const EdgeInsets.only(top: 140),
              child: InkWell(
                onTap: () {
                  profileimg();
                },
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(color: Color(0xFF3063A5),borderRadius: BorderRadius.circular(7)),
                  child: Center(child: Text('Send',style: TextStyle(color: Colors.white,fontSize: 15),)),
                ),
              ),
            )
        ],),
      ),
    );
  }
}