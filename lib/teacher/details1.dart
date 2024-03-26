import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Details1 extends StatefulWidget {
  const Details1({super.key});

  @override
  State<Details1> createState() => _Details1State();
}

class _Details1State extends State<Details1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
           Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  height: 135,
                  width: 380,
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
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Date         '),
                            Text(':3/2/2024')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Time        '),
                            Text(':3.00PM')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Location '),
                            Text(':College Group')
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 15),
                  child: Text('Participants',style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500) ,),
                ),
              ],
            ),
             Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: ListTile(
                    trailing: Icon(Icons.cancel,color: Color(0xFF3063A5),),
                    leading: Image(
                        height: 30,
                        width: 30,
                        image: AssetImage('images/person.png')),
                    title: Text('Name'),
                    subtitle: Text('Department'),
                    textColor: Colors.black,
                    tileColor: Colors.blue[50],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}