import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurrentUser extends ChangeNotifier {
  String _uid;
  String _email;

  String get getUid => _uid;

  String get getEmail => _email;

  //Tạo instance để xác thực sử dụng cho các hàm mà chúng ta sẽ tạo
  FirebaseAuth _auth = FirebaseAuth.instance;

  //generic type là bool vì quá trình đăng kí sẽ không ngay lập tức
  //nhưng muốn biết liệu người dùng có đăng kí được hay không
  //Đăng nhập là tương lai nên phải xử lí bất đồng bộ
  Future<bool> signUpUser(String email, String password) async {
    bool _reveal = false;

    try {
      UserCredential _authCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (_authCredential != null) {
        //Successful
        _reveal = true;
      }
    } catch (e) {
      print(e);
    }

    return _reveal;
  }

  Future<bool> loginUser(String email, String password) async {
    bool _reveal = false;

    try {
      UserCredential _authCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_authCredential != null) {
        //Successful
        //Display uid
        _uid = _authCredential.user.uid;
        _email = _authCredential.user.email;
        _reveal = true;
      }
    } catch (e) {
      print(e);
    }

    return _reveal;
  }
}
