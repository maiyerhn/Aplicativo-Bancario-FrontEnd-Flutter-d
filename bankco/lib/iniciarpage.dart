import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Iniciarpage extends StatefulWidget {
  @override
  _IniciarpageState createState() => _IniciarpageState();
}

class _IniciarpageState extends State<Iniciarpage> {
  String _response = '';
  final TextEditingController _usuario = TextEditingController();
  final TextEditingController _contrasena = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String get usuario => _usuario.text;
  String get contrasena => _contrasena.text;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final response = await http.post(
        Uri.parse('https://6deb-45-238-146-4.ngrok-free.app/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': usuario,
          'password': contrasena,
        }),
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        setState(() {
          _response = responseBody['message'];
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseBody['message'])),
        );

      } else {
        final responseBody = jsonDecode(response.body);
        setState(() {
          _response = responseBody['message'];
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseBody['message'])),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: ImageIcon(AssetImage('lib/img/iconLog.png')),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black12,
        margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
            children: <Widget>[
              _inputtext5(),
              _inputtext1(),
              _inputtext2(),
              _inputtext3(),
              _inputtext4(),
              if (_isLoading) CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_response),
              ),
            ],
          ),
        ),
      ),
          ),
    );
  }

  _inputtext1() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      child: TextFormField(
        controller: _usuario,
        decoration: const InputDecoration(
          labelText: 'Usuario',
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        textAlign: TextAlign.center,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor ingrese su usuario';
          }
          return null;
        },
      ),
    );
  }

  _inputtext2() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      child: TextFormField(
        controller: _contrasena,
        decoration: const InputDecoration(
          labelText: 'Contraseña',
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        obscureText: true,
        textAlign: TextAlign.center,
        maxLength: 4,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor ingrese su contraseña';
          } else if (value.length != 4 || !RegExp(r'^\d+$').hasMatch(value)) {
            return 'La contraseña debe ser de 4 dígitos';
          }
          return null;
        },
      ),
    );
  }

  _inputtext3() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      child: ElevatedButton(
        onPressed: _isLoading ? null : _login,
        child: Center(child: Text('Ingresar')),
      ),
    );
  }

  _inputtext4() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80.0, vertical: 30.0),
      child: ElevatedButton(
        onPressed: () {
        },
        child: Center(child: Text('Registrarse')),
      ),
    );
  }

  _inputtext5() {
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
