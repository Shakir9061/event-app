import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/admin/studentstab.dart';
import 'package:flutter_application_1/teacher/event.dart';
import 'package:flutter_application_1/teacher/notification.dart';
import 'package:flutter_application_1/teacher/profile.dart';
import 'package:flutter_application_1/teacher/request.dart';

class Student_List extends StatefulWidget {
  const Student_List({super.key});

  @override
  State<Student_List> createState() => _Student_ListState();
}

class _Student_ListState extends State<Student_List> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
      
        body: SafeArea(child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Students List',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                                  Padding(
                                    padding: const EdgeInsets.only(left:80),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => stdprofile(),));
                                      },
                                      child: Image(
                                        height: 26,
                                        width: 26,
                                        image: AssetImage('images/profile.png')),
                                    )
                                  ),
                                  Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child:InkWell(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Notification1(),));
                    },
                    child: Image(
                                        height: 26,
                                        width: 26,
                                        image: AssetImage('images/Notification.png')),
                  )
                                  ),
                ],
              ),
            ),
             Expanded(
                        child: TabBarView(children: [
                          Student_Name(),
                          Eventtabbar()
                        ]),
                      ),
          
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
        )),
      ),
    );
  }
}