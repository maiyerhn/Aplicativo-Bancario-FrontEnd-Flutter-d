import 'package:bankco/cargapage.dart';
import 'package:bankco/iniciarpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp (AplicativobankCo());
}

class AplicativobankCo  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BankCo',
      debugShowCheckedModeBanner: false,
      home: Iniciarpage());
  }
  
}

