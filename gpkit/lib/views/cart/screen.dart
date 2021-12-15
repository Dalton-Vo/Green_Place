import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'componentsbottombar/favourite.dart';
import 'componentsbottombar/homepage.dart';
import 'componentsbottombar/profilepage.dart';
import 'componentsbottombar/search.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;
  //Khởi tạo các trang để truy xuất
  final screens = [
    HomePage(),
    SearchPage(),
    FavouritePage(),
    ProfilePage(),
  ];
  Widget build(BuildContext context) {
    final items = [
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.shopping_bag,
        size: 30,
      ),
      Icon(
        Icons.favorite,
        size: 30,
      ),
      Icon(
        Icons.person,
        size: 30,
      )
    ];
    return Scaffold(
        extendBody: true,
        body: screens[index],
        // body: Container(
        //     padding: EdgeInsets.symmetric(horizontal: 70),
        //     child: Column(mainAxisAlignment: MainAxisAlignment.center,
        //         // crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           // Image.network(
        //           //   "https://picsum.photos/200",
        //           //   height: double.infinity,
        //           //   width: double.infinity,
        //           //   fit: BoxFit.cover,
        //           // ),
        //           SizedBox(
        //             height: 15,
        //           ),
        //           ElevatedButton(
        //             //Truy xuất từ key
        //             onPressed: () {
        //               final navigationState = navigationKey.currentState!;
        //               navigationState.setPage(0);
        //             },
        //             child: Text(
        //               "Go to 0",
        //               style: TextStyle(fontSize: 30),
        //             ),
        //             style: ElevatedButton.styleFrom(
        //                 onPrimary: Colors.black,
        //                 primary: Colors.white,
        //                 minimumSize: Size(250, 56)),
        //           )
        //         ])),

        // child: Text(
        //   "$index",
        //   style: TextStyle(
        //       color: Colors.black, fontSize: 120, fontWeight: FontWeight.bold),
        // ),

        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text('shopiing laichi'),
        //   elevation: 0,
        //   centerTitle: true,
        // ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
              key: navigationKey,
              color: Colors.cyan,
              buttonBackgroundColor: Colors.amberAccent,
              backgroundColor: Colors.transparent,
              height: 60,
              index: index,
              onTap: (index) => setState(() => this.index = index),
              items: items),
        ));
  }
}
