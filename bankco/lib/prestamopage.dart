import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:bankco/models/user.dart';
import 'package:bankco/principalpage.dart';
import 'package:bankco/providers/providerUser.dart';

class Prestamopage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final User user;

  Prestamopage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
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
      body: Container(
        color: Colors.black12,
        margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
        child: Form(
          child: Column(
            children: <Widget>[
              _inputtext1(),
              Row(
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
                        _handlePrestamo(context);
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputtext1() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      child: TextFormField(
        controller: _controller,
        decoration: const InputDecoration(
          labelText: 'Ingrese La Cantidad',
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
      ),
    );
  }

  void _handlePrestamo(BuildContext context) async {
    final String cantidadStr = _controller.text;
    if (cantidadStr.isEmpty) {
      _showErrorDialog(context, 'Por favor ingrese una cantidad.');
      return;
    }

    final double cantidad = double.parse(cantidadStr);
    if (cantidad > 500) {
      _showErrorDialog(context, 'La cantidad no debe superar los 500.');
      return;
    }

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final updatedDinero = userProvider.user.dinero + cantidad;
    final updatedDeuda = userProvider.user.deuda + cantidad;

    try {
      userProvider.updateDinero(updatedDinero);
      userProvider.updateDeuda(updatedDeuda);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Principalpage()),
      );
    } catch (e) {
      _showErrorDialog(context, 'Error al actualizar los datos en el servidor.');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
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
}
