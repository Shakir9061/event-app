import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/addeventstd.dart';
import 'package:flutter_application_1/student/stddetails.dart';

class Requesttabstd extends StatefulWidget {
  const Requesttabstd({super.key});

  @override
  State<Requesttabstd> createState() => _RequesttabstdState();
}

class _RequesttabstdState extends State<Requesttabstd> {
  List previous = ['Holi Festival', 'Halloween'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StdDetails(),
                      ));
                },
                title: Text('Holi Festival'),
                tileColor: Color(0xFF3063A5),
                trailing: Text('Accept'),
                textColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                onTap: () {},
                title: Text('Halloween'),
                titleTextStyle: TextStyle(color: Colors.white),
                tileColor: Color(0xFF3063A5),
                trailing: Text('Reject'),
                textColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 410),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Eventaddstd(),
                      ));
                },
                child: Image(
                    height: 70,
                    width: 70,
                    image: AssetImage('images/pluscircle.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
