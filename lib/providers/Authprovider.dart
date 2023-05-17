import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> register() async {
    // Perform the registration logic here
    // After successful registration, set isLoggedIn to true
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> login() async {
    // Perform the login logic here
    // After successful login, set isLoggedIn to true
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    // Perform the logout logic here
    // Set isLoggedIn to false
    _isLoggedIn = false;
    notifyListeners();
  }
}
