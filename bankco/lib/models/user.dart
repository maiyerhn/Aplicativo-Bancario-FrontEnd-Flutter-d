import 'dart:convert';

class User{
  String? nombre;
  String? apellido;
  String? usuario;
  int? contrasena;
  String? tipo;

  User(String jsonString){
    Map data =jsonDecode(jsonString);
    this.nombre = data['nombre'];
    this.apellido = data['apellido'];
    this.usuario = data['usuario'];
    this.contrasena = data['contrasena'];
    this.tipo = data['tipo'];
  }
}