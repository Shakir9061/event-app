import 'package:flutter/material.dart';

class Notification1 extends StatefulWidget {
  const Notification1({super.key});

  @override
  State<Notification1> createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: Text('Onam',style: TextStyle(fontSize: 15,color: Color.fromRGBO(68, 114, 178, 1),
),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5,left: 10),
                      child: Text('We are delighted to announce the upcoming Onam Program, a celebration of joy, culture, and togetherness! The college principal has approved the event, and we can''t wait to make it a memorable occasion for all .',style: TextStyle(fontSize: 14),),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
