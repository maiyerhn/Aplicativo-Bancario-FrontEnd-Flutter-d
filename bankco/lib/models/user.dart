class User {
  final int id;
  final String nombre;
  final String apellido;
  final String usuario;
  final String tipo;

  User({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.usuario,
    required this.tipo,
  });

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