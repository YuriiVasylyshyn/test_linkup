import 'package:flutter/material.dart';
import 'dart:async';

import 'package:test_linkup/StingNomination.dart';

class Fail extends StatefulWidget {
  @override
  _FailState createState() => _FailState();
}

class _FailState extends State<Fail> {
  Timer _timer;
  int _start = 15;

  int counter = 0;
  int counter2 = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StingNomination()),
              );
            });
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void deactivate() {
    super.deactivate();
    _timer.cancel();
  }

  void initState() {
    super.initState();
    setState(() {
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image(
                    image: AssetImage('icons/menu.png'),
                    height: 45,
                    width: 45,
                  ),
                  Image(
                    image: AssetImage('icons/street.png'),
                    height: 45,
                    width: 45,
                  ),
                  Image(
                    image: AssetImage('icons/car.png'),
                    height: 45,
                    width: 45,
                  ),
                  Image(
                    image: AssetImage('icons/appartment.png'),
                    height: 45,
                    width: 45,
                  ),
                  Image(
                    image: AssetImage('icons/plate.png'),
                    height: 45,
                    width: 45,
                  ),
                  Image(
                    image: AssetImage('icons/hotel.png'),
                    height: 45,
                    width: 45,
                  ),
                  Image(
                    image: AssetImage('icons/docks.png'),
                    height: 45,
                    width: 45,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Icon(
                          Icons.thumb_down,
                          color: Color.fromRGBO(206, 17, 65, 1),
                          size: 50,
                        ),
                      ),
                      Text(
                        "NOMINATION",
                        style: TextStyle(
                            color: Color.fromRGBO(206, 17, 65, 1),
                            fontFamily: "PaybAck",
                            fontSize: 50),
                      ),
                    ],
                  ),
                  Text(
                    "FAILS",
                    style: TextStyle(
                        color: Color.fromRGBO(206, 17, 65, 1),
                        fontFamily: "PaybAck",
                        fontSize: 50),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Next nomination in",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PaybAck",
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "$_start",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PaybAck",
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 117,
                    width: 117,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 78, 56, 1),
                          spreadRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: RaisedButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                        size: 40,
                      ),
                      label: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(50, 50, 50, 1),
                        ),
                        child: Center(
                          child: Text(
                            "$counter",
                            style: TextStyle(
                              fontFamily: "PaybAck",
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(0, 138, 99, 1),
                    ),
                  ),
                  Container(
                    height: 117,
                    width: 117,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(123, 7, 37, 1),
                          spreadRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: RaisedButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.thumb_down,
                        color: Colors.white,
                        size: 40,
                      ),
                      label: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(50, 50, 50, 1),
                        ),
                        child: Center(
                          child: Text(
                            "$counter2",
                            style: TextStyle(
                              fontFamily: "PaybAck",
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      shape: CircleBorder(),
                      color: Color.fromRGBO(206, 17, 65, 1),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
