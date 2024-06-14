import 'package:flutter/material.dart';

class CargaPage extends StatelessWidget {
  const CargaPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BankCo')),
        backgroundColor: Colors.blue.shade700
    ),
    body: Center(child: CircularProgressIndicator()),
    );
  }
}