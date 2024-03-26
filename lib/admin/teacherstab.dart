import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/teacherdetailsadmin.dart';

class TeachersTab extends StatefulWidget {
  const TeachersTab({super.key});

  @override
  State<TeachersTab> createState() => _TeachersTabState();
}

class _TeachersTabState extends State<TeachersTab> {
   List std=['Anandu requests Food Festival','Akshay requests christmas'];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Teacherdetadmin(),));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                leading: Image(
                    height: 30,
                    width: 30,
                    image: AssetImage('images/person.png')),
                title: Text('Anandhu requests Food Festival'),
                textColor: Colors.white,
                tileColor: Color(0xFF3063A5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                leading: Image(
                    height: 30,
                    width: 30,
                    image: AssetImage('images/person.png')),
                title: Text('Akshay requests christmas'),
                textColor: Colors.white,
                tileColor: Color(0xFF3063A5),
              ),
            ),
          ],
        ),
    );
  }
}