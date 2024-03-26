import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/teacher/addevent.dart';
import 'package:flutter_application_1/teacher/foodfesdetails.dart';

class UpcomingTeacher extends StatefulWidget {
  const UpcomingTeacher({super.key});

  @override
  State<UpcomingTeacher> createState() => _UpcomingTeacherState();
}

class _UpcomingTeacherState extends State<UpcomingTeacher> {
  List upcoming=['Food festival','Christmas','Music Festival'];
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: upcoming.length,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8,left: 10,right: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Foodfesdetails(),)); 
                      },
                      title: Text(upcoming[index]),
                      titleTextStyle: TextStyle(color: Colors.white),
                      tileColor: Color(0xFF3063A5),
                    ),
                  );
                },),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddEvent(),));
              },
              child: Image(
                height:70 ,
                width: 70,
                
                image: AssetImage('images/pluscircle.png')),
            )
          ],
        ),
      ),
    );
  }
}