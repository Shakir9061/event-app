import 'package:flutter/material.dart';

class Details1std extends StatefulWidget {
  const Details1std({super.key});

  @override
  State<Details1std> createState() => _Details1stdState();
}

class _Details1stdState extends State<Details1std> {
  
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
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
      ),
    );
  }
}