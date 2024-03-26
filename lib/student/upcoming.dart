import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/Requesttab.dart';
import 'package:flutter_application_1/student/eventtab.dart';
import 'package:flutter_application_1/student/notificationstd.dart';
import 'package:flutter_application_1/student/profilestd.dart';

class UpcomingStd extends StatefulWidget {
  const UpcomingStd({super.key});

  @override
  State<UpcomingStd> createState() => _UpcomingStdState();
}

class _UpcomingStdState extends State<UpcomingStd> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Event',
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profilestd(),
                              ));
                        },
                        child: Image(
                            height: 26,
                            width: 26,
                            image: AssetImage('images/profile.png')),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Notificationstd(),
                              ));
                        },
                        child: Image(
                            height: 26,
                            width: 26,
                            image: AssetImage('images/Notification.png')),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 5),
              child: Row(
                children: [
                  TabBar(
                      labelStyle:
                          TextStyle(color: Color(0xFF3063A5), fontSize: 18),
                      indicatorColor: Color(0xFF3063A5),
                      labelPadding: EdgeInsets.symmetric(horizontal: 5),
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      dividerHeight: 0,
                      tabs: [Text('Event'), Text('Request')]),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(children: [Eventtabstd(), Requesttabstd()])),
          ],
        ),
      ),
    );
  }
}
