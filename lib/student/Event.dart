import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/previous.dart';
import 'package:flutter_application_1/student/upcoming.dart';

class Event1 extends StatefulWidget {
  const Event1({super.key});

  @override
  State<Event1> createState() => _Event1State();
}

class _Event1State extends State<Event1> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
          body: 
              Stack(
                children:[ SafeArea(
                  child: Column(
                    children: [
                
                      
                         Expanded(child: TabBarView(children: [UpcomingStd(),PreviousStd()])),
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
                            
                              Text('Upcoming'),
                              Text('Previous')
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