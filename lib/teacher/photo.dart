import 'package:flutter/material.dart';

class Photo extends StatefulWidget {
  const Photo({super.key});

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  List image=['images/img1.jpg','images/img2.jpg','images/img3.jpg','images/img4.jpg','images/img1.jpg','images/img2.jpg','images/img3.jpg','images/img4.jpg','images/img1.jpg','images/img2.jpg','images/img3.jpg','images/img4.jpg',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Expanded(
          child: GridView.builder(
            itemCount: image.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio: .9),
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
    );
  }
}
