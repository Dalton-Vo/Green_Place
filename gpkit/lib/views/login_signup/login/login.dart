import 'package:flutter/material.dart';
import 'package:localization_release/views/login_signup/login/loginform.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(212, 241, 244, 1),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                Container(
                  width: 160,
                  height: 160,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Image.asset(
                    "assets/images/eco-friendly.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                LoginForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
