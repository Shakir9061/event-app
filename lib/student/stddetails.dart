import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StdDetails extends StatefulWidget {
  var event;
   StdDetails({super.key, required this. event});

  @override
  State<StdDetails> createState() => _StdDetailsState();
}

class _StdDetailsState extends State<StdDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title:  Text(
                    'Student details',style: TextStyle(fontWeight: FontWeight.w500),
                    
                  ),
                  centerTitle: true,
                 
                  bottom: PreferredSize(preferredSize: Size.fromHeight(2), child: Container(color:Colors.black12 ,height: 2,)),
                  toolbarHeight: 60,
        ),
     body: SafeArea(
        child: Column(
          children: [
            
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 5),
                child: Image(
                  height: 100,
                  width: 100,
                  image: AssetImage('images/person1.png')),
              ),
              Text(widget.event['name'],style: TextStyle(fontSize: 16),),
             Padding(
               padding: const EdgeInsets.only(top: 20),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Department'),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('Request Event'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('Date'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('Time'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('Location'),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(':'),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(':'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(':'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(':'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(':'),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(widget.event['department']),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(widget.event['event']),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('25/03/2025'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: Text('10.00'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('College Hall'),
                      )
                    ],
                  )
                ],
               ),
             ),
             Column(
               children: [
                 Row(
                          children: [
                            Padding(
                 padding: const EdgeInsets.only(top: 20,left: 20),
                 child: Text('Host ',style: TextStyle(fontSize: 16,color: Color(0xFF3063A5),),),
                            ),
                          ],
                        ),
               ],
             ),
        Padding(
          padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
          child: ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                          textColor: Colors.black,
                          tileColor: Color.fromRGBO(68, 114, 178, 0.2),

                          leading: Image(
                            height: 40,
                            width: 40,
                            image: AssetImage('images/person.png')),
                          title: Text('Host'),
                          subtitle: Text('Department'),
                          
                        ),
        ),
           Row(
         children: [
           Padding(
             padding: const EdgeInsets.only(top: 20,left: 20),
             child: Text('Description  :',style: TextStyle(fontSize: 16),),
           ),
         ],
       ),
       Row(
         children: [
           Padding(
             padding: const EdgeInsets.only(left: 20,top: 10),
             child: Text(widget.event['description']),
           ),
         ],
       ),    
              
          ],
        ),
      ),
    );
  }
}