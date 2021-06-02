import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/shared/model/user/user_model.dart';

class UserChanger with ChangeNotifier {
  UserChanger(this.user);

  UserModel? user;

  void setUserChanger(UserModel? user) {
    this.user = user;
    notifyListeners();
  }
}
