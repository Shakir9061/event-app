import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/studentdetadmin.dart';

class Studenttab extends StatefulWidget {
  const Studenttab({super.key});

  @override
  State<Studenttab> createState() => _StudenttabState();
}

class _StudenttabState extends State<Studenttab> {
  List std = ['Adhil requests Food Festival', 'rajan requests christmas'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Studentdetadmin(),));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                leading: Image(
                    height: 30,
                    width: 30,
                    image: AssetImage('images/person.png')),
                title: Text('Adhil requests Food Festival'),
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
                title: Text('rajan requests christmas'),
                textColor: Colors.white,
                tileColor: Color(0xFF3063A5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
