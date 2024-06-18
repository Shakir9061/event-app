import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/studentdetadmin.dart';

class Studenttab extends StatefulWidget {
  const Studenttab({super.key});

  @override
  State<Studenttab> createState() => _StudenttabState();
}

class _StudenttabState extends State<Studenttab> {
 
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       body: StreamBuilder(stream: FirebaseFirestore.instance.collection('Request event').snapshots(), builder: (context, snapshot) {
         if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
         }
         return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
           var data=snapshot.data!.docs[index];
           return Padding(
             padding: const EdgeInsets.only(left: 15,top: 10,right: 15),
             child: ListTile(
              tileColor: Colors.blue[50],
              leading: CircleAvatar(
                backgroundImage:  NetworkImage(data['imageurl'])
              ),
              title:Text('${data['name']} requests ${data['event']}'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Studentdetadmin(data:data),));
              },
             ),
           );

         },);
       },),
      ),
    );
  }
}
