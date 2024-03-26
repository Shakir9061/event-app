import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/admin/previousadmin.dart';
import 'package:flutter_application_1/admin/request.dart';
import 'package:flutter_application_1/admin/upcomingadmin.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text(
                    'Event',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )),
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
                              tabs: [Text('Upcoming'), Text('Previous')]),
                          ],
                        ),
                      ),
                      Expanded(child: TabBarView(children: [Admin_Upcoming(),PreviousAdmin()]))
            ],
          ),
        ),
      ),
    );
  }
}