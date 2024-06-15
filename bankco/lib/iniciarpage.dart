
import 'package:flutter/material.dart';

class Iniciarpage extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _userController = TextEditingController();
    final TextEditingController _contrasenaController = TextEditingController();
    
 
    

     void _valform() {
    if (_formKey.currentState!.validate()) {
      // Validación exitosa, obtener y procesar los datos 
      String user = _userController.text;
      String contrasena = _contrasenaController.text;
      
      print('Usuario: $user');
      print('Contrasena: $contrasena');

      // Mostrar un mensaje al usuario
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Datos obtenidos: Usuario: $user, Contraseña: $contrasena'),
        ),
      );
    }
  }
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.blue.shade700,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('BankCo'),
            SizedBox(width: 8), // Espacio entre el texto y el icono
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
