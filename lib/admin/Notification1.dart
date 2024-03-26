import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/admin/Addnotification.dart';

class Notification_admin extends StatefulWidget {
  const Notification_admin({super.key});

  @override
  State<Notification_admin> createState() => _Notification_adminState();
}

class _Notification_adminState extends State<Notification_admin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    padding: const EdgeInsets.only(right: 90, left: 20),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                  ),
                  Text(
                    'Notification',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 145,
                width: 350,
                decoration: BoxDecoration(color: Color.fromRGBO(68, 114, 178, 0.2),borderRadius: BorderRadius.circular(7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5,left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Onam',style: TextStyle(fontSize: 15,color: Color.fromRGBO(68, 114, 178, 1),
                          
                          ),),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image(
                              
                              height: 24,
                              width: 24,
                              image: AssetImage('images/delete.png'))
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5,left: 10),
                      child: Text('We are delighted to announce the upcoming Onam Program, a celebration of joy, culture, and togetherness! The college principal has approved the event, and we can''t wait to make it a memorable occasion for all .',style: TextStyle(fontSize: 14),),
                    ),
                  ],
                ),
              ),
            ),
             Padding(
               padding: const EdgeInsets.only(top: 480),
               child: InkWell(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Addnotification(),)) ;
                },
                child: Image(
                  height:60 ,
                  width: 60,
                  
                  image: AssetImage('images/pluscircle.png')),
                           ),
             )
          ],
        ),
      ),
    );
  }
}