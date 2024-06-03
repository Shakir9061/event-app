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
        appBar: AppBar(
          title:  Text(
                    'Event',style: TextStyle(fontWeight: FontWeight.w500),
                    
                  ),
                  centerTitle: true,
                  actions: [
                    InkWell(
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
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Notificationstd(),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0,right: 15),
                          child: Image(
                              height: 26,
                              width: 26,
                              image: AssetImage('images/Notification.png')),
                        ),
                      )
                  ],
                  bottom: PreferredSize(preferredSize: Size.fromHeight(2), child: Container(color:Colors.black12 ,height: 2,)),
                  toolbarHeight: 60,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               
                
                
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
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
