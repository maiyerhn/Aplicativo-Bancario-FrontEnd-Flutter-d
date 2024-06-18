import 'dart:convert';
import 'package:bankco/providers/providerUser.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bankco/models/user.dart';
import 'package:bankco/pagopage.dart';
import 'package:bankco/prestamopage.dart';

class Principalpage extends StatefulWidget {
  final int userId;

  Principalpage({required this.userId});

  @override
  _PrincipalpageState createState() => _PrincipalpageState();
}

class _PrincipalpageState extends State<Principalpage> {
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = User.empty();
    getUserDetails();
  }

  Future<void> getUserDetails() async {


    try {
      print('Obteniendo detalles del usuario para el ID: ${widget.userId}');
        var url = Uri.parse('https://310c-45-238-146-4.ngrok-free.app/users/${widget.userId}');
        var response = await http.get(url, headers: {
        'Accept': 'application/json',
       });
      print('Código de estado de la respuesta: ${response.statusCode}');
      if (response.statusCode == 200) {
        print(response.toString());
        print(response.headers);
        print(response.statusCode);
        var userData = json.decode(response.body);
        print(userData.toString());
        User user = User(
          id: userData['id'],
          nombre: userData['nombre'],
          apellido: userData['apellido'],
          usuario: userData['usuario'],
          tipo: userData['tipo'],
        );
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        setState(() {
          _user = user;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al obtener datos del usuario')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {},
        ),
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black12,
          margin: EdgeInsets.all(40.0),
          child: Form(
            child: Column(
              children: <Widget>[
                _inputText1(),
                _inputText2(),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade700,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Prestamopage(user: _user)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue.shade700,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          child: Text('Préstamo'),
                        ),
                      ),
                      SizedBox(width: 30),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade700,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Pagopage(user: _user)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue.shade700,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          child: Text('Pagar'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputText1() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Center(
        child: Text('Bienvenido ${_user.nombre} ${_user.apellido}'),
      ),
    );
  }

  Widget _inputText2() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      child: Center(child: Text('Dinero: ')),
    );
  }
}
