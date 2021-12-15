import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

void main() => runApp(RunApp());

class RunApp extends StatelessWidget {
  const RunApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: DemoNetwork(),
      ),
    );
  }
}

class DemoNetwork extends StatefulWidget {
  const DemoNetwork({Key key}) : super(key: key);

  @override
  _DemoNetworkState createState() => _DemoNetworkState();
}

class _DemoNetworkState extends State<DemoNetwork> {
  @override
  String title = '';
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${title} wefmowefj "),
        RaisedButton(
          onPressed: () {
            getHttp();
          },
          child: Text("Click me"),
        )
      ],
    );
  }

  void getHttp() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts/1');

      if (response.statusCode == 200) {
        setState(() {
          var post = Post.fromJson(response.data);
          title = post.body;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  //Xử lý logic http dạng GET
  makeHttpGet() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    //200 <= status code < 300 suscessful
    if (200 <= response.statusCode && response.statusCode < 300) {
      // print(response.body);
      var post = Post.fromJson(jsonDecode(response.body));
      // print(post);
      setState(() {
        title = post.title;
      });
    }
  }

  //Xử lý logic http dạng POST
  makehttpPost() async {
    var client = http.Client();
    final response = await client.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: {"title": "Hello World", "body": "Newcode"});

    //200 <= status code < 300 suscessful
    if (response.statusCode == 201) {
      // print(response.body);
      var post = Post.fromJson(jsonDecode(response.body));
      // print(post);
      setState(() {
        title = post.title;
      });
    }
  }
}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });
  //parse theo map
  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
