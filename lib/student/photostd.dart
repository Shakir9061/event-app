import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/addphotostd.dart';

class Photostd extends StatefulWidget {
  const Photostd({super.key});

  @override
  State<Photostd> createState() => _PhotostdState();
}

class _PhotostdState extends State<Photostd> {
    List image=['images/img1.jpg','images/img2.jpg','images/img3.jpg','images/img4.jpg','images/img1.jpg','images/img2.jpg','images/img3.jpg','images/img4.jpg','images/img1.jpg','images/img2.jpg','images/img3.jpg','images/img4.jpg',];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: 
         
            Column(
              children: [
                Expanded(
                  child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GridView.builder(
                    itemCount: image.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio: .9,crossAxisSpacing: 2,mainAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      return GridTile(child: Image(
                        fit: BoxFit.cover,
                        height: 95,
                        width: 95,
                        image:AssetImage(image[index]) ));
                    },
                  ),
                        ),
                ),
                 Padding(
                   padding: const EdgeInsets.only(bottom: 20),
                   child: InkWell(
                     onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Addphotostd(),));
                     },
                     child: Image(
                         height: 70,
                         width: 70,
                         image: AssetImage('images/pluscircle.png')),
                   ),
                 ),
              ],
            ),
                   
        
    );
  }
}