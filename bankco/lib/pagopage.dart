import 'package:bankco/models/user.dart';
import 'package:flutter/material.dart';

class Pagopage extends StatelessWidget {
   final User? user;

  const Pagopage({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
              icon: const ImageIcon(AssetImage('lib/img/iconLog.png')),
              onPressed: () {},
            ),
          ],
        ),) ,
    );
  }
  
}