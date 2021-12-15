import 'package:flutter/material.dart';
import 'package:localization_release/services/statesprovider/currentuser.dart';
import 'package:localization_release/widget/customcontainer.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void CheckForm() {
    //Kiểm tra điền đầy đủ chưa
    if (_passwordController.text == _passwordController.text) {
      //Tuyền vào email, password, context
      _signUpUser(_emailController.text, _passwordController.text, context);
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Password don't match"),
        duration: Duration(seconds: 2),
      ));
    }
  }

  //Cung cấp trạng thái người dùng hiện tại
  void _signUpUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      if (await _currentUser.signUpUser(email, password)) {
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return ShadowContainer(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline),
              hintText: "Full Name",
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email),
              hintText: "Email",
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "Password",
            ),
            obscureText: true,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_open),
              hintText: "Confirm Password",
            ),
            obscureText: true,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: RaisedButton(
              // padding: EdgeInsets.symmetric(horizontal: 100, vertical: 40),
              onPressed: CheckForm,
              color: Colors.orange[400],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
