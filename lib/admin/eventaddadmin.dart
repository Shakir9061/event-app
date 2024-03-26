import 'package:flutter/material.dart';

class Addeventadmin extends StatefulWidget {
  const Addeventadmin({super.key});

  @override
  State<Addeventadmin> createState() => _AddeventadminState();
}

class _AddeventadminState extends State<Addeventadmin> {
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
                        padding: const EdgeInsets.only(right: 90, left: 20),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios)),
                      ),
                      Text(
                        ' Add Event',
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
                        'Date',
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
                        'Time',
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
                        'Location',
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
                padding: const EdgeInsets.only(top: 130),
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(color: Color(0xFF3063A5),borderRadius: BorderRadius.circular(7)),
                  child: Center(child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 15),)),
                ),
              )
              ],
            ),
          ),
       ),
    );
  }
}