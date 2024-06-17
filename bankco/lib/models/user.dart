import 'dart:convert';

import 'package:bankco/models/datos.dart';

class User {
  String? nombre;
  String? apellido;
  String? usuario;
  int? contrasena;
  String? tipo;
  

  User(String jsonString){
    Datos datos = new Datos();
    Map data =jsonDecode(jsonString);
    this.nombre = data['nombre'];
    this.apellido = data['apellido'];
    this.usuario = data['usuario'];
    this.contrasena = data['contrasena'];
    this.tipo = "usuario";
  }
}