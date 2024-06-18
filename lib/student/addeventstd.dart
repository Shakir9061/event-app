import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Eventaddstd extends StatefulWidget {
  const Eventaddstd({super.key});

  @override
  State<Eventaddstd> createState() => _EventaddstdState();
}

class _EventaddstdState extends State<Eventaddstd> {
  var event = TextEditingController();
  var name = TextEditingController();
  var department = TextEditingController();
  var phonenumber = TextEditingController();
  var description = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String? uid;
  
  @override
  void initState() {
    super.initState();
    setuserdetails();
  }

  Future<void> setuserdetails() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      uid = prefs.getString('stdid');
      if (uid != null && uid!.isNotEmpty) {
        Stream<DocumentSnapshot> studentstream = FirebaseFirestore.instance
            .collection('student data')
            .doc(uid)
            .snapshots();
        studentstream.listen((studentsnapshot) {
          if (studentsnapshot.exists) {
            setState(() {
              name.text = studentsnapshot['name'] ?? '';
              department.text = studentsnapshot['department'] ?? '';
            });
          }
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error fetching student details: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> eventRequest() async {
    if (formkey.currentState!.validate()) {
      SharedPreferences pref =await SharedPreferences.getInstance();
      var imageurl=pref.getString('imageurl');
      
      try {
        await FirebaseFirestore.instance.collection('Request event').doc().set({
          'event': event.text,
          'name': name.text,
          'department': department.text,
          'phonenumber': phonenumber.text,
          'description': description.text,
          'imageurl':imageurl ?? ''
        });
        event.clear();
        name.clear();
        department.clear();
        phonenumber.clear();
        description.clear();
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Event requested successfully'),
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error requesting event: $e'),
          backgroundColor: Colors.red,
        ));
      } 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
                          'Event Request',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formkey,
            child: Column(
              children: [
               
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Request Event',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: event,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter event name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Name',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Department',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Phone No',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: phonenumber,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                       
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Description',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 100,
                    width: 350,
                    child: TextFormField(
                      controller: description,
                      maxLines: 5,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: InkWell(
                    onTap: () {
                      eventRequest();
                    } 
                     ,
                    child: Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                        color:  Color(0xFF3063A5),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                                'Submit',
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
      ),
    );
  }
}
