import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user.dart'; 
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

  Future<void> updateDinero(double nuevoDinero) async {
    if (nuevoDinero != null) {
      _user = _user.copyWith(dinero: nuevoDinero);
      notifyListeners();
      _updateBackend();
    } else {
      print('Error: El valor de nuevoDinero es nulo.');
    }
  }

  Future<void> updateDeuda(double nuevaDeuda) async {
    if (nuevaDeuda != null) {
      _user = _user.copyWith(deuda: nuevaDeuda);
      notifyListeners();
      _updateBackend();
    } else {
      print('Error: El valor de nuevaDeuda es nulo.');
    }
  }

 void _updateBackend() async {
  final url = Uri.parse('https://22cd-45-238-146-4.ngrok-free.app/users/${user.id}');

   try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
       body: json.encode({
          'id': _user.id,
          'nombre': _user.nombre,
          'apellido': _user.apellido,
          'usuario': _user.usuario,
          'tipo': _user.tipo,
          'dinero': _user.dinero,
          'deuda': _user.deuda,
        }),
      );

      if (response.statusCode == 200) {
        print('Datos del usuario actualizados correctamente');
      } else {
        print('Error en la solicitud HTTP: ${response.statusCode}');
        throw Exception('Failed to update user data');
      }
    } catch (e) {
      print('Error en la solicitud HTTP: $e');
      throw Exception('Failed to update user data');
    }
 }
}