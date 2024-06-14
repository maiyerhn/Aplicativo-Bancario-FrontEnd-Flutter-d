import 'package:flutter/material.dart';

class Iniciarpage extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BankCo')),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Form(child: Column(children:<Widget> [
        _inputtext1(),
        _inputtext2(),
        _inputtext3()
      ],
      )),
    );
  }
  
  _inputtext1() {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: 
      TextFormField(
        decoration: InputDecoration(
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
        decoration: InputDecoration(
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
      ElevatedButton(
                onPressed: null,
                child: Center(child: Text('Enviar')))
      );
  }
  
}