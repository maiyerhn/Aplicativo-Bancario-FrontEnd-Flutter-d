import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  
   final TextEditingController _usuario = TextEditingController();
  final TextEditingController _contrasena = TextEditingController();

  RegistroPage({super.key});

  String get usuario => _usuario.text;
  String get contrasena => _contrasena.text;

  @override
  
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.blue.shade700,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('BankCo'),
            const SizedBox(width: 8),
            IconButton(
              icon: const ImageIcon(AssetImage('lib/img/iconLog.png')),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black12,
          margin: const EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _inputtext6(),
                _inputtext1(),
                _inputtext2(),
                _inputtext3(),
                _inputtext4(),
                _inputtext5(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  _inputtext1() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      child: 
      TextFormField(
        controller: _usuario,
        decoration: const InputDecoration(
          labelText: 'Nombre',
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
      margin: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      child: 
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Apellido',
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
      margin: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      child: 
      TextFormField(
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
  _inputtext4() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      child: 
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'contraseña',
          alignLabelWithHint: true,
          labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
        ),
        textAlign: TextAlign.center,
      ),
      );
  }
  _inputtext5() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      child: 
      
      const ElevatedButton(
                onPressed: null,
                child: Center(child: Text('Registrarse')))
      );
  }
  
}

_inputtext6() {
  return Container(
    margin: const EdgeInsetsDirectional.only(top: 20),
    child: Center(
      child: Text(
        'Registro',
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.blue.shade900,
        ),
      ),
    ),
  );
}