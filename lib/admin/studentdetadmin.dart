import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Studentdetadmin extends StatefulWidget {
 QueryDocumentSnapshot<Map<String, dynamic>>? data;
   Studentdetadmin({super.key, this.data,});

  @override
  State<Studentdetadmin> createState() => _StudentdetadminState();
}

class _StudentdetadminState extends State<Studentdetadmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title:   Text(
                      'Student Detail',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500 ),
                    ),
                    centerTitle: true,
      ),
        body: SafeArea(
          
        child: Column(
          children: [
            
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 5),
                child:CircleAvatar(
                  radius: 50,
                  backgroundImage:NetworkImage(widget.data!['imageurl']) ,
                )
              ),
              Text(widget.data!['name'],style: TextStyle(fontSize: 16),),
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
                      Text(widget.data!['department']),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(widget.data!['event']),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('21/01/2025'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: Text('10.00AM'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('College Ground'),
                      )
                    ],
                  )
                ],
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
       Padding(
         padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
         child: Text('Corem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.'),
       ),  
       Padding(
              padding: const EdgeInsets.only(top: 180),
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
    );
  }
}