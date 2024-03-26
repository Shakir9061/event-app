import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsStd extends StatefulWidget {
  const DetailsStd({super.key});

  @override
  State<DetailsStd> createState() => _DetailsStdState();
}

class _DetailsStdState extends State<DetailsStd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
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
                      'Student Detail',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage('images/person.png')),
              ),
              Text(
                'Name',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register No',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(':12345')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Department',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(':Bcom')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Phone No',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(':8767898767')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(':123@gmail.com')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 380),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 165,
                      decoration: BoxDecoration(
                          color: Color(0xFF3063A5),
                          borderRadius: BorderRadius.circular(7)),
                      child: Center(
                          child: Text(
                        'Accept',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                    ),
                    Container(
                      height: 50,
                      width: 165,
                      decoration: BoxDecoration(
                          color: Color(0xFF3063A5),
                          borderRadius: BorderRadius.circular(7)),
                      child: Center(
                          child: Text(
                        'Reject',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
