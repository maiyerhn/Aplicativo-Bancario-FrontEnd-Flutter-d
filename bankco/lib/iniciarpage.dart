import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Iniciarpage extends StatelessWidget {
  String _response = 'Presiona el botón para enviar la solicitud';
  
   final TextEditingController _usuario = TextEditingController();
  final TextEditingController _contrasena = TextEditingController();

  String get usuario => _usuario.text;
  String get contrasena => _contrasena.text;

  Future<void> _sendGetRequest(String usuario, String contrasena) async {
    final String url = 'https://example.com/api';

    final Uri uri = Uri.parse(url).replace(queryParameters: {
      'usuario': usuario,
      'contrasena': contrasena,
    });

    try {
      final response = await http.get(uri);

          String usuarioEsperado = _usuario.toString();
          String contrasenaEsperada = contrasena.toString();
          final info = jsonDecode(response.body);
          
      if (response.statusCode == 200) {
        
      } else {
        
      }
    } catch (e) {
      
    }
  }
  
  @override
  
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.blue.shade700,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('BankCo'),
            SizedBox(width: 8),
            IconButton(
              icon: ImageIcon(AssetImage('lib/img/iconLog.png')),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black12,
        margin: EdgeInsets.all(40.0),
        child: Form(child: Column(children:<Widget> [
          _inputtext1(),
          _inputtext2(),
          _inputtext3(),
          _inputtext4()
        ],
        )),
      ),
    );
  }
  
  _inputtext1() {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: 
      TextFormField(
        controller: _usuario,
        decoration: const InputDecoration(
          labelText: 'Usuario',
          alignLabelWithHint: true,
          labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
        ),
        textAlign: TextAlign.center,
      ),
      );
  }

  _inputtext2() {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: 
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Contraseña',
          alignLabelWithHint: true,
          labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
        ),
        textAlign: TextAlign.center,

      ),
      );
  }
  _inputtext3() {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: 
      const ElevatedButton(
                onPressed: null,
                child: Center(child: Text('Ingresar')))
      );
  }
  _inputtext4() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80.0),
      child: 
      
      const ElevatedButton(
                onPressed: null,
                child: Center(child: Text('Registrarse')))
      );
  }
  
}
