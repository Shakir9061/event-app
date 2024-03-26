import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/admin/Teacher.dart';
import 'package:flutter_application_1/admin/event.dart';
import 'package:flutter_application_1/admin/eventpage.dart';
import 'package:flutter_application_1/admin/splash.dart';
import 'package:flutter_application_1/admin/teacherpage.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       
        body: 
            Stack(
              children:[ SafeArea(
                child: Column(
                  children: [
              
                    
                       Expanded(child: TabBarView(children: [TeacherPage(),EventPage()])),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(border:Border.all(color: Colors.black),borderRadius: BorderRadius.circular(40)),
                          child: TabBar(
                            labelColor: Colors.white,
                            labelStyle: TextStyle(fontSize: 20),
                            indicatorPadding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: BoxDecoration(color: Color(0xFF3063A5),borderRadius: BorderRadius.circular(30)),
                            tabs: [
                          
                            Text('Request'),
                            Text('Event')
                          ]),
                        ),
                      ),
                    ),
                  
                    
                   
                
                  ],
                ),
                
              ),]
            ),
          
        
      ),
      
    );
  }
}
