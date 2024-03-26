import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/onamfestival.dart';

class PreviousStd extends StatefulWidget {
  const PreviousStd({super.key});

  @override
  State<PreviousStd> createState() => _PreviousStdState();
}

class _PreviousStdState extends State<PreviousStd> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: SafeArea(
        child: Column(
          children: [
          Center(child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text('Event',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
          )),
            Padding(
                    padding: const EdgeInsets.only(top: 40,left: 10,right: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OnamFestivalstd(),));
                      },
                      title: Text('Onam Festival'),
                      titleTextStyle: TextStyle(color: Colors.white),
                      tileColor: Color(0xFF3063A5),
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                      onTap: () {
                      },
                      title: Text('Music Festival'),
                      titleTextStyle: TextStyle(color: Colors.white),
                      tileColor: Color(0xFF3063A5),
                    ),
                  ),
        ],),
      ),
    );
  }
}