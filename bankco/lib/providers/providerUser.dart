import 'package:flutter/material.dart';
import 'package:bankco/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: 0,
    nombre: '',
    apellido: '',
    usuario: '',
    tipo: '',
    dinero: 0,
    deuda: 0,
  );

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void updateDinero(double nuevoDinero) {
    _user = _user.copyWith(dinero: nuevoDinero);
    notifyListeners();
  }

  void updateDeuda(double nuevaDeuda) {
    _user = _user.copyWith(deuda: nuevaDeuda);
    notifyListeners();
  }
}

