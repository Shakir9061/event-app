import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: StreamBuilder(stream: FirebaseFirestore.instance.collection('Teacher data').snapshots(), builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
            var teacher=snapshot.data!.docs[index];
  return Padding(
    padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
    child: ListTile(
      tileColor: Colors.blue[50],
      leading: CircleAvatar(child: Icon(Icons.person),),
      title: Text(teacher['name']),
      subtitle: Text(teacher['department']),
    ),
  );
          },);
        },),
      ),
    );
  }
}
