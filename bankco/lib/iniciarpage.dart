import 'dart:convert';
import 'package:bankco/providers/providerUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:bankco/models/user.dart';
import 'package:bankco/principalpage.dart';

class Iniciarpage extends StatefulWidget {
  const Iniciarpage({super.key});

  @override
  _IniciarpageState createState() => _IniciarpageState();
}

class _IniciarpageState extends State<Iniciarpage> {
  final TextEditingController _controllerUsuario = TextEditingController();
  final TextEditingController _controllerClave = TextEditingController();
  bool _isLoading = false;
  String _response = '';

  Future<void> _iniciarSesion(BuildContext context) async {
    final String usuario = _controllerUsuario.text;
    final String contrasena = _controllerClave.text;

    if (usuario.isEmpty || contrasena.isEmpty) {
      _showErrorDialog('Por favor ingrese el usuario y la contraseña.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final url = Uri.parse('https://c5de-45-238-146-4.ngrok-free.app/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'usuario': usuario, 'contrasena': contrasena}),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        setState(() {
          _isLoading = false;
          _response = responseBody['message'];
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseBody['message'])),
        );

        User user = User.fromJson(responseBody['user']);
        Provider.of<UserProvider>(context, listen: false).setUser(user);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Principalpage()),
        );
      } else {
        setState(() {
          _isLoading = false;
          _response = 'Usuario o contraseña incorrectos.';
        });
        _showErrorDialog('Usuario o contraseña incorrectos.');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _response = 'Error al iniciar sesión. Inténtelo de nuevo.';
      });
      print('Error en la solicitud HTTP: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al iniciar sesión. Inténtelo de nuevo.')),
      );
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: ImageIcon(AssetImage('lib/img/iconLog.png')),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Container(
        color: Colors.black12,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
            _inputText5(),
            _inputText1(),
            _inputText2(),
            _inputText3(),
            _inputText4(),
            if (_isLoading) CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_response),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputText1() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      child: TextField(
        controller: _controllerUsuario,
        decoration: InputDecoration(
          labelText: 'Usuario',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _inputText2() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      child: TextFormField(
        controller: _controllerClave,
        decoration: InputDecoration(
          labelText: 'Contraseña',
        ),
        obscureText: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor ingrese la contraseña.';
          }
          if (value.length != 4) {
            return 'La contraseña debe tener exactamente 4 dígitos.';
          }
          return null;
        },
      ),
    );
  }

  Widget _inputText3() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      child: ElevatedButton(
        onPressed: _isLoading ? null : () => _iniciarSesion(context),
        child: Text('Iniciar Sesión'),
      ),
    );
  }

  Widget _inputText4() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80.0, vertical: 30.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Registrarse'),
      ),
    );
  }

  Widget _inputText5() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 20),
      child: Center(
        child: Text(
          'Iniciar Sesión',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.blue.shade900,
          ),
        ),
      ),
    );
  }
}
