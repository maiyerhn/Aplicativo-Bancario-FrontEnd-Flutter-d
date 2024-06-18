import 'package:bankco/homepage.dart';
import 'package:bankco/providers/providerUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
   runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(), 
      child: AplicativobankCo(),
    ),
  );
}

class AplicativobankCo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BankCo',
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }}
