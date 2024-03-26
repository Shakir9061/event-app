import 'package:flutter/material.dart';

class Profilestd extends StatefulWidget {
  const Profilestd({super.key});

  @override
  State<Profilestd> createState() => _ProfilestdState();
}

class _ProfilestdState extends State<Profilestd> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: SafeArea(
        child: Column(
          children: [
            Center(child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 90,left: 20),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  ),
                  Text('Profile',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image(
                height: 100,
                width: 100,
                image: AssetImage('images/person.png')),
            ),
             Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 30),
                  child: Text('Name',style: TextStyle(fontSize: 14),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                height: 40,
                width: 350,
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 30),
                  child: Text('Department',style: TextStyle(fontSize: 14),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                height: 40,
                width: 350,
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
              Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 30),
                  child: Text('Register No',style: TextStyle(fontSize: 14),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                height: 40,
                width: 350,
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
              Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 30),
                  child: Text('Phone No',style: TextStyle(fontSize: 14),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                height: 40,
                width: 350,
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
              Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 30),
                  child: Text('Email',style: TextStyle(fontSize: 14),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                height: 40,
                width: 350,
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top: 140),
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
    );
  }
}