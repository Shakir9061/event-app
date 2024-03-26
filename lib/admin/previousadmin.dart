import 'package:flutter/material.dart';

class PreviousAdmin extends StatefulWidget {
  const PreviousAdmin({super.key});

  @override
  State<PreviousAdmin> createState() => _PreviousAdminState();
}

class _PreviousAdminState extends State<PreviousAdmin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
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
                        child: Text('Onam Festival',style: TextStyle(fontSize: 15,color: Color.fromRGBO(68, 114, 178, 1),
                ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
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
                        Text('  28/08/2023'),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('  9.00AM'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('  College Hall'),
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
             Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  height: 135,
                  width: 380,
                  decoration: BoxDecoration(color: Color.fromRGBO(68, 114, 178, 0.2),borderRadius: BorderRadius.circular(7)),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5,left: 10),
                        child: Text('Food Festival',style: TextStyle(fontSize: 15,color: Color.fromRGBO(68, 114, 178, 1),
                ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
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
                        Text('  26/04/2023'),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('  6.00PM'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('  College Hall'),
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
          ],
        ),
      ),
    );
  }
}