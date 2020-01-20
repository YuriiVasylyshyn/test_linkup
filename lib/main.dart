import 'package:flutter/material.dart';
import 'package:test_linkup/components/redButton/index.dart';
import 'package:test_linkup/components/wrapper/index.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 150.0,
                width: 150.0,
                child: Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
              Text(
                'mafia moles',
                style: TextStyle(
                  fontFamily: 'PaybAck',
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 145),
                child: RedButton(
                  padding: false,
                  text: 'New Game',
                  icon: Icons.arrow_right,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Wrapper(
                                screen: 'sting',
                              )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
