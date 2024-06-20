class User {
  final int id;
  final String nombre;
  final String apellido;
  final String usuario;
  final String tipo;
  final double dinero;
  final double deuda;

  User({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.usuario,
    required this.tipo,
    this.dinero = 0,
    this.deuda = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      usuario: json['usuario'],
      tipo: json['tipo'],
      dinero: json['dinero'] ?? 0,
      deuda: json['deuda'] ?? 0,
    );
  }

  User copyWith({
    int? id,
    String? nombre,
    String? apellido,
    String? usuario,
    String? tipo,
    double? dinero,
    double? deuda,
  }) {
    return User(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      usuario: usuario ?? this.usuario,
      tipo: tipo ?? this.tipo,
      dinero: dinero ?? this.dinero,
      deuda: deuda ?? this.deuda,
    );
  }
}
