import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  var _scanBarcode = '';

  int _counter = 0;

  int defaultValue = 0;

  void initState() {
    super.initState();
  }

  final _controller = TextEditingController();

  void _saveTask() {
    final taskName = _controller.text;

    FirebaseFirestore.instance.collection("tasks").add({"name": taskName});

    _controller.clear();
  }

  static final String title = "Green Place";

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      _counter += int.tryParse(_scanBarcode) ?? defaultValue;

      FirebaseFirestore.instance.collection("qr_codes").add({
        "raw_data": _counter,
        "time": new DateTime.now().millisecondsSinceEpoch
      }).then((_) {
        print("One document added.");
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          //centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.qr_code_scanner_sharp,
                color: Colors.black,
              ),
              onPressed: () => scanQR(),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(215, 225, 236, 1),
                  Color.fromRGBO(255, 255, 255, 1)
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 370,
                      height: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromRGBO(60, 165, 92, 1),
                            Color.fromRGBO(181, 172, 73, 1)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                              offset: Offset(0, -15),
                              blurRadius: 30)
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/planet-earth.png"),
                          Text('My Point \n $_counter / 3000',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ))
              ])),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(children: [
                Expanded(
                    child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: "Enter task"),
                )),
                FlatButton(
                  child: Text("Save", style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  onPressed: () {
                    _saveTask();
                  },
                )
              ]),
            ]),
          ),
        ])));
  }
}
