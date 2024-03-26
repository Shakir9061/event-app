import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/Notification1.dart';
import 'package:flutter_application_1/admin/Teacher.dart';
import 'package:flutter_application_1/admin/event.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({super.key});

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
             Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Wrap(
                    
                    children:[
                    Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: Text('Request',style: TextStyle(fontSize: 25),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:100,top: 5),
                      child: InkWell(
                        onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Notification_admin(),)) ;
                        },
                        child: Image(
                                          height: 26,
                                          width: 26,
                                          image: AssetImage('images/Notification.png')),
                      ),
                    )
                  ] ),
                ),
            Padding(
                        padding: const EdgeInsets.only(top: 40,left: 5),
                        child: Row(
                          children: [
                            TabBar(
                              labelStyle: TextStyle(color: Color(0xFF3063A5),fontSize: 18 ),
                              indicatorColor:  Color(0xFF3063A5),
                              labelPadding: EdgeInsets.symmetric(horizontal: 5),
                              tabAlignment: TabAlignment.start,
                              isScrollable: true,
                              dividerHeight: 0,
                              tabs: [Text('Teacher'), Text('Event')]),
                          ],
                        ),
                      ),
                      Expanded(child: TabBarView(
                        children: [Teacher(), event()])),
          ],
        ),
      ),
    );
  }
}