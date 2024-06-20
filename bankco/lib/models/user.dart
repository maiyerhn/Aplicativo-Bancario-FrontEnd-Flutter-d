import 'dart:convert';

class User {
  int id;
  String nombre;
  String apellido;
  String usuario;
  String tipo;
  

  User({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.usuario,
    required this.tipo,
  });

    User.empty() : this(id: 0, nombre: '', apellido: '', usuario: '', tipo: ''); 

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      usuario: json['usuario'],
      tipo: json['tipo'],
    );
  }
}