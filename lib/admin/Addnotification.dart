import 'package:flutter/material.dart';

class Addnotification extends StatefulWidget {
  const Addnotification({super.key});

  @override
  State<Addnotification> createState() => _AddnotificationState();
}

class _AddnotificationState extends State<Addnotification> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 80, left: 20),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios)),
                      ),
                      Text(
                        'Add Notification',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        'Event Name',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 45,
                    width: 350,
                    child: TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                 Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        'Description',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 134,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(width: 0.7)),
                  ),
                ),
                 Padding(
                padding: const EdgeInsets.only(top: 390),
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(color: Color(0xFF3063A5),borderRadius: BorderRadius.circular(7)),
                  child: Center(child: Text('Send',style: TextStyle(color: Colors.white,fontSize: 15),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}