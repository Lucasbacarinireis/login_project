import 'package:flutter/material.dart';

class LoginController {
  String? _login;
  String? _pass;

  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  setLogin(String value) => _login = value;

  setPassword(String value) {
    _pass = value;
  }

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(const Duration(seconds: 2));
    inLoader.value = false;
    if (_login == "admin" && _pass == "123") return true;
    return false;
  }
}
