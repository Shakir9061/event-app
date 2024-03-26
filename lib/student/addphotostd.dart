import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addphotostd extends StatefulWidget {
  const Addphotostd({super.key});

  @override
  State<Addphotostd> createState() => _AddphotostdState();
}

class _AddphotostdState extends State<Addphotostd> {
  XFile? pick;
  File? image;
  
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
                        'Description',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 384,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(width: 0.7)),
                        child:  IconButton(
                          onPressed: () async {
                           ImagePicker picked=ImagePicker() ;
                           pick=await picked.pickImage(source: ImageSource.gallery);
                           setState(() {
                             image=File(pick!.path);
                           });
                          },
                          icon:image==null ? Image(
                            height: 144,
                            width: 144,
                            
                            image: AssetImage('images/addimg1.png')) :Image.file(image!, fit:BoxFit.fill ,)
                        ) 
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
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(color: Color(0xFF3063A5),borderRadius: BorderRadius.circular(7)),
                child: Center(child: Text('Send',style: TextStyle(color: Colors.white,fontSize: 15),)),
              ),
            )
        ],),
      ),
    );
  }
}