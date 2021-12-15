import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localization_release/views/splashscreen.dart/secondscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  // Đây là phương thức đầu tiên được gọi khi widget được tạo.
  // Them startTimer vào class
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  // thêm chức năng trì hoãn
  startTimer() async {
    var duration = Duration(seconds: 4);
    //Sau khi trì hoãn 4 giây thì sẽ chuyển hướng đến trang khác
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SecondScreen()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: [
          // Container(
          //   height: 150,
          //   child: Image.asset("assets/images/spiderman.jpg"),
          // ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/spiderman.jpg"))),
          ),
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "LAICHI SHOPPING",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 80),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 1,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
