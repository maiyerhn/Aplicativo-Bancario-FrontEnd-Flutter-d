import 'package:bankco/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/providerUser.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(), 
      child: MaterialApp(
        title: 'Tu Aplicación',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Homepage(), 
      ),
    );
  }
}
