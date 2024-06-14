import 'dart:convert';

class User{
  String nombre;
  String apellido;
  String usuario;
  String contrasena;
  String tipo;

  User(String jsonString){
    Map data =jsonDecode(jsonString);
    this.nombre = data['nombre'];
  }
}