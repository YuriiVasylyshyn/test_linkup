import 'package:flutter/material.dart';
import 'package:test_linkup/Fail.dart';
import 'dart:async';

import 'package:test_linkup/Success.dart';
import 'package:test_linkup/services/asyncStorage.dart';

class VoteScreen extends StatefulWidget {
  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  int counter = 0;
  int counter2 = 0;

  Timer _timer;
  int _start = 15;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            setState(() {
              if (counter > counter2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Success()),
                );
              } else
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fail()),
                );
            });
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void initState() {
    super.initState();
    getData();
    setState(() {
      startTimer();
    });
  }

  var leader2;

  getData() async {
    var date = await getFromAsyncStorage('string', 'leader', true);
    setState(() {
      leader2 = date;
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
              Text(
                "ROUND 6: DOCKS $_start",
                style: TextStyle(
                  color: Color.fromRGBO(206, 17, 65, 1),
                  fontFamily: 'PaybAck',
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image(
                      image: AssetImage('icons/redcircle.png'),
                      height: 20,
                      width: 20,
                    ),
                    Image(
                      image: AssetImage('icons/redcircle.png'),
                      height: 20,
                      width: 20,
                    ),
                    Image(
                      image: AssetImage('icons/whitecircle.png'),
                      height: 20,
                      width: 20,
                    ),
                    Image(
                      image: AssetImage('icons/blackcircle.png'),
                      height: 20,
                      width: 20,
                    ),
                    Image(
                      image: AssetImage('icons/blackcircle.png'),
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
              Text(
                "STING NOMINATION",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PaybAck',
                  fontSize: 30,
                ),
              ),
              leader2 != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            'LEADER',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Image(
                            image: AssetImage(leader2["img"]),
                            height: 45,
                            width: 45,
                          ),
                        ),
                        Text(
                          leader2["name"],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : Container(
                      alignment: Alignment.center,
                      child: new CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Color(0xFFf44336)),
                      ),
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
                      onPressed: () {
                        setState(() {
                          ++counter;
                        });
                      },
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
                      onPressed: () {
                        setState(() {
                          ++counter2;
                        });
                      },
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
          ),
        ],
      ),
    );
  }
}
