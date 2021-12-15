import 'dart:async';

import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key key, this.minValue = 0, this.maxValue = 10})
      : super(key: key);
  final int minValue;
  final int maxValue;

  // final ValueChanged<int> onChanged;

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final _controller = TextEditingController();
  final _streamController = StreamController<int>();
  Stream<int> get _stream => _streamController.stream;
  Sink<int> get _sink => _streamController.sink;
  int initValue = 1;

  @override
  void initState() {
    _sink.add(initValue);
    _stream.listen((event) => _controller.text = event.toString());
    super.initState();
  }

  @override
  int value = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FavouritePage"),
      ),
      body: Container(
        child: Card(
          margin: EdgeInsets.all(5),
          elevation: 20,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.green, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          shadowColor: Colors.lightGreenAccent,
          child: Column(children: [
            ListTile(
                // leading: ConstrainedBox(
                //   constraints: BoxConstraints(
                //     minWidth: 100,
                //     minHeight: 100,
                //     maxWidth: 100,
                //     maxHeight: 100,
                //   ),
                leading: Image.asset(
                  'assets/images/yeezy.jpg',
                ),
                title: Text(
                  "Let's Talk About Love",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Stack(
                  children: [
                    Text("Yeezy 450"),

                    Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  _sink.add(--initValue);
                                },
                                child: Icon(Icons.remove)),
                            Container(
                              width: 50,
                              child: TextField(
                                controller: _controller,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  _sink.add(++initValue);
                                },
                                child: Icon(Icons.add)),
                          ],
                        )),

                    // Text(data)
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}

class IncreamentAndDecreasment extends StatefulWidget {
  @override
  _IncreamentAndDecreasmentState createState() =>
      _IncreamentAndDecreasmentState();
}

class _IncreamentAndDecreasmentState extends State<IncreamentAndDecreasment> {
  final _controller = TextEditingController();
  final _streamController = StreamController<int>();
  Stream<int> get _stream => _streamController.stream;
  Sink<int> get _sink => _streamController.sink;
  int initValue = 1;

  @override
  void initState() {
    _sink.add(initValue);
    _stream.listen((event) => _controller.text = event.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      _sink.add(--initValue);
                    },
                    child: Icon(Icons.remove)),
                Container(
                  width: 50,
                  child: TextField(
                    controller: _controller,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _sink.add(++initValue);
                    },
                    child: Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
