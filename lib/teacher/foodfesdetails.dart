import 'package:flutter/material.dart';

class Foodfesdetails extends StatefulWidget {
  const Foodfesdetails({super.key});

  @override
  State<Foodfesdetails> createState() => _FoodfesdetailsState();
}

class _FoodfesdetailsState extends State<Foodfesdetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(
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
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(context: context, builder: (context) {
                           return AlertDialog(
                 
                  content: Text('Confirm co-Ordinator'),
                  contentPadding: EdgeInsets.only(top: 20,left: 30),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Submit'),
                    ),
                  ],
                );
                        },);
                      },
                      icon: Icon(Icons.cancel,color: Color(0xFF3063A5),)),
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
      ) ,
    );
  }
}