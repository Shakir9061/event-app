import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/admin/studentstab.dart';
import 'package:flutter_application_1/admin/teacherstab.dart';

class event extends StatefulWidget {
  const event({super.key});

  @override
  State<event> createState() => _eventState();
}

class _eventState extends State<event> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 40,
                  width: 140,
                  decoration: BoxDecoration(  color: Color.fromARGB(255, 196, 192, 192),borderRadius: BorderRadius.circular(7)),
                  
                  child: Row(
                    children: [
                      TabBar(
                        tabAlignment: TabAlignment.center,
                        isScrollable: true,
                        labelPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 6),
                        indicatorSize: TabBarIndicatorSize.tab,
                       indicator: BoxDecoration( color: Color(0xFF3063A5),  borderRadius: BorderRadius.circular(7)),
                        dividerHeight: 0,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                      
                        tabs: [
                        Text('Students'),
                        Text('Teachers'),
                      ]),
                    
                    ],
                  ),
                ),
              ),
            ),
             Expanded(child: TabBarView(children: [
                      Studenttab(),
                      TeachersTab(),
                    ]))
          ],
        )
      ),
    );
  }
}