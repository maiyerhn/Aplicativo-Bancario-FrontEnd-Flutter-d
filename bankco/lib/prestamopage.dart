import 'package:bankco/models/user.dart';
import 'package:bankco/principalpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Prestamopage extends StatelessWidget {
  late final User user;

  Prestamopage({required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
            ),],),),
        body: Container(
        color: Colors.black12,
        margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
        child: Form(child: Column(children:<Widget> [
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Principalpage(userId: user.id,),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700, 
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: Text('Préstamo'),
              ),),
        ]),
        ],
      ),
    )));
  }
   _inputtext1() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
      child: 
      TextFormField(
        controller: null,
        decoration: const InputDecoration(
          labelText: 'Ingrese La Cantidad',
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            
                      fontWeight: FontWeight.bold,
                    ),
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.center,
      ),
      );
  }

  
}