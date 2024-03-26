import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/teacher/previous.dart';
import 'package:flutter_application_1/teacher/upcoming.dart';

class Eventtabbar extends StatefulWidget {
  const Eventtabbar({super.key});

  @override
  State<Eventtabbar> createState() => _EventtabbarState();
}

class _EventtabbarState extends State<Eventtabbar> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
             Padding(
                        padding: const EdgeInsets.only(top: 20,left: 5),
                        child: Row(
                          children: [
                            TabBar(
                              labelStyle: TextStyle(color: Color(0xFF3063A5),fontSize: 18 ),
                              indicatorColor:  Color(0xFF3063A5),
                              labelPadding: EdgeInsets.symmetric(horizontal: 5),
                              tabAlignment: TabAlignment.start,
                              isScrollable: true,
                              dividerHeight: 0,
                              tabs: [Text('Upcoming'), Text('Previous')]),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          UpcomingTeacher(),
                          Previousteacher()
                        ]),
                      )

                     
          ],
        ),
      ),
    );
  }
}