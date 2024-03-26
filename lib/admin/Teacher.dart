import 'package:flutter/material.dart';

class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
             
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListTile(
                        textColor: Colors.black,
                        tileColor: Colors.blue[50],
                        leading: Image(
                          height: 40,
                          width: 40,
                          image: AssetImage('images/person.png')),
                        title: Text('Teacher'),
                        subtitle: Text('Department'),
                        trailing: Wrap(spacing: 12, children: [
                          Icon(Icons.cancel_outlined,color: Colors.red,),
                          Icon(Icons.check_circle_outline_rounded,color: Colors.green,),
                        ]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
