import 'package:flutter/material.dart';
import 'package:localization_release/services/statesprovider/currentuser.dart';
import 'package:localization_release/views/QR_code/scanner.dart';
import 'package:localization_release/views/login_signup/signup/signup.dart';
import 'package:localization_release/widget/customcontainer.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _loginUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      if (await _currentUser.loginUser(email, password)) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Scanner()));
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Incorrect Login Info!"),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return ShadowContainer(
      child: Column(
        children: [
          Center(
            child: Text(
              "Log In",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email),
              hintText: "Email",
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "Password",
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 20.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: RaisedButton(
              color: Colors.green[400],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              onPressed: () {
                _loginUser(
                    _emailController.text, _passwordController.text, context);
              },
            ),
          ),
          FlatButton(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Don't have an account ?"),
                  TextSpan(
                    text: ' Sign up ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red[300]),
                  ),
                  TextSpan(
                    text: 'here !',
                  ),
                ],
              ),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
