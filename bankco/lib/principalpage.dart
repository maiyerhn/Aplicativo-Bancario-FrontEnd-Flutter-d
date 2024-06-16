import 'package:bankco/pagopage.dart';
import 'package:bankco/prestamopage.dart';
import 'package:flutter/material.dart';

class Principalpage  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.person_2), 
          onPressed: () {
            print('Botón al inicio presionado');
         },
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
                _inputtext1(),
                _inputtext2(),
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
                    MaterialPageRoute(builder: (context) => Prestamopage()),
                  );
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
              ),
            ),
                      SizedBox(width: 30, ), 
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
                    MaterialPageRoute(builder: (context) => Pagopage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700, 
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: Text('Pagar'),
              ),
            ),
              SizedBox(height: 20.0), 

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
   _inputtext1() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: 
        Center(child: Text('Bienvenido'))
      );
  }
  _inputtext2() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      child: 
        Center(child: Text('Dinero: '))
      );
  }
}