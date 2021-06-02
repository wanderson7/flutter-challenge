import 'package:flutter/material.dart';

class SessionChanger with ChangeNotifier {
  SessionChanger({this.isUserIsLogged = false});

  bool isUserIsLogged;

  bool isUserLogged() => isUserIsLogged;

  void setUserLogged({required bool isLogged}) {
    isUserIsLogged = isLogged;
    notifyListeners();
  }
}
