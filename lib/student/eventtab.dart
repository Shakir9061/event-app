import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/foodfestival.dart';

class Eventtabstd extends StatefulWidget {
  const Eventtabstd({super.key});

  @override
  State<Eventtabstd> createState() => _EventtabstdState();
}

class _EventtabstdState extends State<Eventtabstd> {
    List upcoming=['Food festival','Christmas','Music Festival'];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          children: [
            Padding(
                    padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FoodFestivalstd(),));
                      },
                      title: Text('Food Festival'),
                      titleTextStyle: TextStyle(color: Colors.white),
                      tileColor: Color(0xFF3063A5),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 8,left: 10,right: 10),
                    child: ListTile(
                                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),

                      title: Text('christmas'),
                      titleTextStyle: TextStyle(color: Colors.white),
                      tileColor: Color(0xFF3063A5),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 8,left: 10,right: 10),
                    child: ListTile(
                                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),

                      title: Text('Music Festival'),
                      titleTextStyle: TextStyle(color: Colors.white),
                      tileColor: Color(0xFF3063A5),
                    ),
                  ),
          
          ],
        ),
    );
  }
}