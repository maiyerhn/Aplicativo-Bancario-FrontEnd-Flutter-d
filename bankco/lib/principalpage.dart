import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bankco/models/user.dart';
import 'package:bankco/prestamopage.dart';
import 'package:bankco/pagopage.dart';
import 'package:bankco/providers/providerUser.dart';

class Principalpage extends StatelessWidget {
  const Principalpage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final User user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
        backgroundColor: Colors.blue.shade700,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
          child: Column(
            children: <Widget>[
              _inputText1(user),
              _inputText2(user),
              _inputText3(user),
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Prestamopage(user: user)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue.shade700,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: const Text('Préstamo'),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade700,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Pagopage(user: user)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue.shade700,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: const Text('Pagar'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputText1(User user) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Center(
        child: Text('Bienvenido ${user.nombre} ${user.apellido}'),
      ),
    );
  }

  Widget _inputText2(User user) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30.0),
      child: Center(child: Text('Dinero: ${user.dinero.toString()}')),
    );
  }

  Widget _inputText3(User user) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30.0),
      child: Center(child: Text('Deuda: ${user.deuda.toString()}')),
    );
  }
}
