import 'package:flutter/material.dart';

import 'package:test_linkup/StingNomination.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 60.0,
            width: 274.0,
            margin: EdgeInsets.fromLTRB(0, 350, 0, 0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(123, 7, 37, 1),
                  spreadRadius: 1,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: RaisedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StingNomination()),
                );
              },
              icon: Icon(
                Icons.arrow_right,
                color: Colors.white,
                size: 50,
              ),
              label: Text(
                'New Game',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Typewriter',
                  color: Colors.white,
                ),
              ),
              color: Color.fromRGBO(206, 17, 65, 1),
            ),
          ),
        ),
      ]),
    );
  }
}
