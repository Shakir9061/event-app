import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/student/Details1std.dart';
import 'package:flutter_application_1/student/photostd.dart';

class OnamFestivalstd extends StatefulWidget {
  const OnamFestivalstd({super.key});

  @override
  State<OnamFestivalstd> createState() => _OnamFestivalstdState();
}

class _OnamFestivalstdState extends State<OnamFestivalstd> {
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 120, left: 5),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios)),
                      ),
                      Text(
                        'Details',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )),
                 Padding(
                        padding: const EdgeInsets.only(top: 20,left: 10),
                        child: Row(
                          children: [
                            TabBar(
                              labelStyle: TextStyle(color: Color(0xFF3063A5),fontSize: 18 ),
                              indicatorColor:  Color(0xFF3063A5),
                              labelPadding: EdgeInsets.symmetric(horizontal: 5),
                              tabAlignment: TabAlignment.start,
                              isScrollable: true,
                              dividerHeight: 0,
                              tabs: [Text('Details'), Text('Photo')]),
                          ],
                        ),
                      ),
                      
                      Expanded(child: TabBarView(children: [
                        Details1std(),Photostd()
                      ])),
                      
              ],
            ),
          ),
          
        ),
    );
    
    
  }
}