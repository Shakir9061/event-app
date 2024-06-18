import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/addphotostd.dart';

class Photostd extends StatefulWidget {
  const Photostd({super.key});

  @override
  State<Photostd> createState() => _PhotostdState();
}

class _PhotostdState extends State<Photostd> {
   
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Expanded(
            child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('event_photos')
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No images found'));
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var doc = snapshot.data!.docs[index];
                  return Image.network(doc['imageUrl'], fit: BoxFit.cover);
                },
              );
            },
                  ),
          ),
        ),
      
         
          
           floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>Addphotostd (),));
        },
        child: Icon(Icons.add,color: Colors.white,size: 40,),
        backgroundColor: Color(0xFF3063A5),
             shape: CircleBorder(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
    
  }
}