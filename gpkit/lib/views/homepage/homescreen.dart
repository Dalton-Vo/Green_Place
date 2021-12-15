import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//carousel_pro package
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageCarouse(),
    );
  }
}

class ImageCarouse extends StatefulWidget {
  const ImageCarouse({Key key}) : super(key: key);

  @override
  _ImageCarouseState createState() => _ImageCarouseState();
}

class _ImageCarouseState extends State<ImageCarouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Home'),
      ),
      body: ListView(
        children: [
          SizedBox(
              height: 200.0,
              width: double.infinity,
              child: Carousel(
                boxFit: BoxFit.cover,
                images: [
                  AssetImage("assets/images/fashion.jpg"),
                  AssetImage("assets/images/electronicdevices.jpeg"),
                  AssetImage("assets/images/jordan.jpg"),
                ],
                animationCurve: Curves.easeInOutCubic,
                animationDuration: Duration(microseconds: 2000),
              ))
        ],
      ),
    );
  }
}
