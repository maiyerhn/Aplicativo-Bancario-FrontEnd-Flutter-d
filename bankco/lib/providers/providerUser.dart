import 'package:flutter/material.dart';
import 'package:bankco/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(id: 0, nombre: '', apellido: '', usuario: '', tipo: '');
  User get user => _user;
  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}