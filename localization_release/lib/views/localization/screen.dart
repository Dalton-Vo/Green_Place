import 'package:flutter/material.dart';
import 'package:localization_release/generated/l10n.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  int counter = 0;

  void _increasement() {
    setState(() {
      counter++;
    });
  }

  Widget build(BuildContext context) {
    //Gọi delegate để cấp quyền truy cập
    final delegate = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(delegate.pageTitle),
        actions: [
          PopupMenuButton(
              shape: Border.all(width: 0.5),
              //Lúc tùy chọn ngôn ngữ sẽ hiển thị ở dưới appbar
              offset: Offset(0, kToolbarHeight),
              icon: Icon(Icons.language),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              S.load(Locale("fr", "FR"));
                            });
                          },
                          child: Expanded(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/France.svg.png',
                                  height: 30,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(
                                  width: 9.0,
                                ),
                                Text('French')
                              ],
                            ),
                          )),
                    ),
                    PopupMenuItem(
                      child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              S.load(Locale("en", "US"));
                            });
                          },
                          child: Expanded(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/england.svg.png',
                                  height: 30,
                                  width: 45,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(
                                  width: 9.0,
                                ),
                                Text('English')
                              ],
                            ),
                          )),
                    ),
                    PopupMenuItem(
                      child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              S.load(Locale("jp", "JP"));
                            });
                          },
                          child: Expanded(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/japan.svg.png',
                                  height: 30,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(
                                  width: 9.0,
                                ),
                                Text('Japanese')
                              ],
                            ),
                          )),
                    ),
                    PopupMenuItem(
                        child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                S.load(Locale("vi", "VI"));
                              });
                            },
                            child: Expanded(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/vietnam.svg.png',
                                    height: 30,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  SizedBox(
                                    width: 9.0,
                                  ),
                                  Text('VietNam')
                                ],
                              ),
                            )))
                  ])
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increasement,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              delegate.clickme + " ${counter}",
            )
            //Truyền giá trị vào bộ đếm
            // delegate.counterText(counter)),
          ],
        ),
      ),
    );
  }
}
