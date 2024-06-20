import 'package:bankco/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/providerUser.dart';


void main() {
  runApp(BankCo());
}

class BankCo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return ChangeNotifierProvider(
      create: (context) => UserProvider(), 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BankCo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Homepage(), 
      ),
    );
  }
}
