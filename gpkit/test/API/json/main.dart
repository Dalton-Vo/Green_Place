import 'package:flutter/material.dart';
import 'dart:convert';

import 'json.dart';

const jsonString = '''{
  "orderId": 123456,
  "user": {"fullName": "Ryan Nguyen", "email": "ryannguyen@gmail.com"},
  "Products": [
    {
      "productId": 123,
      "productName": "Macbook",
      "quantity": 10,
      "price": 100.5
    },

    {"productId": 4534, "productName": "vvvv", "quantity": 20, "price": 99.5}
  ]
}''';

class JsonInfo extends StatefulWidget {
  const JsonInfo({Key key}) : super(key: key);

  @override
  _JsonInfoState createState() => _JsonInfoState();
}

class _JsonInfoState extends State<JsonInfo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
          onPressed: () {
            //jsonString phải theo format là String '''
            Map<String, dynamic> map = jsonDecode(jsonString);
            //truy cập map theo dạng key value
            print(map["orderId"]);
            var order = Welcome.fromJson(map);
            // // // //Truy xuất dữ liệu
            print(order.orderId);
            print(order.user.email);
            order.products.forEach((Product) {
              print(Product.price);
            });
          },
          child: Text("click here"),
        ),
      ),
    );
  }
}
