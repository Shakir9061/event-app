import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/eventaddadmin.dart';
import 'package:flutter_application_1/admin/eventdetailsadmin.dart';

class Admin_Upcoming extends StatefulWidget {
  const Admin_Upcoming({super.key});

  @override
  State<Admin_Upcoming> createState() => _Admin_UpcomingState();
}

class _Admin_UpcomingState extends State<Admin_Upcoming> {
    List upcoming=['Food festival','Christmas','Music Festival'];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Eventdetailsadmin(),));

                      },
                      title: Text(upcoming[index]),
                      titleTextStyle: TextStyle(color: Colors.white),
                      tileColor: Color(0xFF3063A5),
                      trailing: Image(
                        height: 24,
                        width: 24,
                        image: AssetImage('images/bin.png'))
                    ),
                  );
                },),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Addeventadmin(),));
              },
              child: Image(
                height:70 ,
                width: 70,
                
                image: AssetImage('images/pluscircle.png')),
            )
          ],
        ),
    );
  }
}