import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/onamfestival.dart';

class PreviousStd extends StatefulWidget {
  const PreviousStd({super.key});

  @override
  State<PreviousStd> createState() => _PreviousStdState();
}

class _PreviousStdState extends State<PreviousStd> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios)),
          title:  Text(
                    'Event',style: TextStyle(fontWeight: FontWeight.w500),
                    
                  ),
                  centerTitle: true,
                 
                  bottom: PreferredSize(preferredSize: Size.fromHeight(2), child: Container(color:Colors.black12 ,height: 2,)),
                  toolbarHeight: 60,
        ),
       body: SafeArea(
        child: Column(
          children: [
         
            Padding(
                    padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OnamFestivalstd(),));
                      },
                      title: Text('Onam Festival'),
                      titleTextStyle: TextStyle(color: Colors.white),
                      tileColor: Color(0xFF3063A5),
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                      onTap: () {
                      },
                      title: Text('Music Festival'),
                      titleTextStyle: TextStyle(color: Colors.white),
                      tileColor: Color(0xFF3063A5),
                    ),
                  ),
        ],),
      ),
    );
  }
}