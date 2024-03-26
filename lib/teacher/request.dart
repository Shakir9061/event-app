import 'package:flutter/material.dart';
import 'package:flutter_application_1/teacher/details.dart';
import 'package:flutter_application_1/teacher/profile.dart';

class Student_Name extends StatefulWidget {
  const Student_Name({super.key});

  @override
  State<Student_Name> createState() => _Student_NameState();
}

class _Student_NameState extends State<Student_Name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: ListTile(
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsStd(),));
              },
              leading: Image(
                  height: 30,
                  width: 30,
                  image: AssetImage('images/person.png')),
              title: Text('Student Name'),
              subtitle: Text('Department'),
              textColor: Colors.black,
              tileColor: Colors.blue[50],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: ListTile(
                    onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsStd(),));

                    },
                    leading: Image(
                        height: 30,
                        width: 30,
                        image: AssetImage('images/person.png')),
                    title: Text('Name'),
                    subtitle: Text('Department'),
                    textColor: Colors.black,
                    tileColor: Colors.blue[50],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
