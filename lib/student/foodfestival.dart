import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/student/registersuccess.dart';

class FoodFestivalstd extends StatefulWidget {
  const FoodFestivalstd({super.key});

  @override
  State<FoodFestivalstd> createState() => _FoodFestivalstdState();
}

class _FoodFestivalstdState extends State<FoodFestivalstd> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title:  Text(
                    'Details',style: TextStyle(fontWeight: FontWeight.w500),
                    
                  ),
                  centerTitle: true,
                 
                  bottom: PreferredSize(preferredSize: Size.fromHeight(2), child: Container(color:Colors.black12 ,height: 2,)),
                  toolbarHeight: 60,
        ),
      body:SafeArea(
        child: Column(
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
                        child: Text('Food Festival',style: TextStyle(fontSize: 15,color: Color.fromRGBO(68, 114, 178, 1),
                ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 5),
                        child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        
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
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                        Text('  03/01/2025'),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('  3.00PM'),
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
            Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: ListTile(
                                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),

                    leading: Image(
                        height: 30,
                        width: 30,
                        image: AssetImage('images/person.png')),
                    title: Text('Student Name'),
                    subtitle: Text('Department'),
                    textColor: Colors.black,
                    tileColor:Color.fromRGBO (241, 246, 255, 1)
                  ),
                ),
             Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: ListTile(
                                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),

                    leading: Image(
                        height: 30,
                        width: 30,
                        image: AssetImage('images/person.png')),
                    title: Text('Name'),
                    subtitle: Text('Department'),
                    textColor: Colors.black,
                    tileColor:Color.fromRGBO (241, 246, 255, 1)
                  ),
                );
              },
            ),
          ),
           Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterSuccess(),));
                },
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(color: Color(0xFF3063A5),borderRadius: BorderRadius.circular(7)),
                  child: Center(child: Text('Register',style: TextStyle(color: Colors.white,fontSize: 15),)),
                ),
              ),
            )
          ],
        ),
      ) ,
    );
  }
}