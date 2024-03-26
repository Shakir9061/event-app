import 'package:flutter/material.dart';

class Eventdetailsadmin extends StatefulWidget {
  const Eventdetailsadmin({super.key});

  @override
  State<Eventdetailsadmin> createState() => _EventdetailsadminState();
}

class _EventdetailsadminState extends State<Eventdetailsadmin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      'Event Details',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text('Food Festival',style: TextStyle(fontSize: 15,color:Color(0xFF3063A5) ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                Text('Date '),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Time '),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Location '),
                ),
                                     
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
                
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                Text('  05/09/2025'),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('  9.00 AM'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('  College Ground'),
                ),
                
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
         child: Text('traditional genres such as folk and classical music, a music festival can be defined as a community event, with performances of singing and instrument playing, that is often presented with a theme such as a music genre '),
       ),
       Row(
         children: [
           Padding(
             padding: const EdgeInsets.only(top: 20,left: 20),
             child: Text('Host ',style: TextStyle(fontSize: 16,color: Color(0xFF3063A5),),),
           ),
         ],
       ),
        Padding(
          padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
          child: ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                          textColor: Colors.black,
                          tileColor: Colors.blue[50],
                          leading: Image(
                            height: 40,
                            width: 40,
                            image: AssetImage('images/person.png')),
                          title: Text('Name'),
                          subtitle: Text('Department'),
                          
                        ),
        ),
        Row(
         children: [
           Padding(
             padding: const EdgeInsets.only(top: 10,left: 20),
             child: Text(' Add Host ',style: TextStyle(fontSize: 16,color: Color(0xFF3063A5),),),
           ),
         ],
       ),
        Padding(
          padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
          child: ListTile(
                          textColor: Colors.black,
                          tileColor: Colors.grey[300],
                         trailing: Icon(Icons.arrow_drop_down),
                          
                        ),
        ),
         Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Container(
                  height: 50,
                  width: 375,
                  decoration: BoxDecoration(color: Color(0xFF3063A5),borderRadius: BorderRadius.circular(7)),
                  child: Center(child: Text('Add host',style: TextStyle(color: Colors.white,fontSize: 15),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 50,
                  width: 375,
                  decoration: BoxDecoration(color: Color(0xFF3063A5),borderRadius: BorderRadius.circular(7)),
                  child: Center(child: Text('Confirm',style: TextStyle(color: Colors.white,fontSize: 15),)),
                ),
              )
        ],
       ),
     ),
    );
  }
}