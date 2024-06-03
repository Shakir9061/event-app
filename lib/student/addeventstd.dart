import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/Requesttab.dart';

class Eventaddstd extends StatefulWidget {
  const Eventaddstd({super.key});

  @override
  State<Eventaddstd> createState() => _EventaddstdState();
}

class _EventaddstdState extends State<Eventaddstd> {
  var event=TextEditingController();
  var name=TextEditingController();
  var department=TextEditingController();
  var phonenumber=TextEditingController();
  var description=TextEditingController();
  final formkey=GlobalKey<FormState>();
  
  Future<void>eventRequest()async{
    await FirebaseFirestore.instance.collection('Request event').doc().set({
      'event':event.text,
      'name':name.text,
      'department':department.text,
      'phonenumber':phonenumber.text,
      'description':description.text
    });
    event.clear();
    name.clear();
    department.clear();
    phonenumber.clear();
    description.clear();
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('event requested')));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
         child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 90, left: 20),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios)),
                        ),
                        Text(
                          'Event Request',
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 30),
                        child: Text(
                          'Request Event',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      width: 350,
                      child: TextFormField(
                        controller: event,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 30),
                        child: Text(
                          'Name',
                          style: TextStyle(fontSize: 15),
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
                          style: TextStyle(fontSize: 15),
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
                          style: TextStyle(fontSize: 15),
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
                          'Description',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child:SizedBox(
                      height: 100,
                      width: 350,
                      child: TextFormField(
                        controller: description,
                        maxLines: 5,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                   Padding(
                  padding: const EdgeInsets.only(top:50 ),
                  child: InkWell(
                    onTap: () {
                      eventRequest();
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
       ),
    );
  }
}