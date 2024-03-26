import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/studentstab.dart';
import 'package:flutter_application_1/teacher/detailstab.dart';
import 'package:flutter_application_1/teacher/music.dart';

class Previousteacher extends StatefulWidget {
  const Previousteacher({super.key});

  @override
  State<Previousteacher> createState() => _PreviousteacherState();
}

class _PreviousteacherState extends State<Previousteacher> {
  List previous=['Onam Festival','Music Festival'];
  List festival=[DetailsTAb(),Musicfes()];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: previous.length,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8,left: 10,right: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => festival[index],));
              },
              title: Text(previous[index]),
              titleTextStyle: TextStyle(color: Colors.white),
              tileColor: Color(0xFF3063A5),
            ),
          );
        },),
      ),
    );
  }
}