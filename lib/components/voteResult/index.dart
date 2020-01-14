import 'package:flutter/material.dart';
import 'package:test_linkup/constants/listsToUse/index.dart';
import 'package:test_linkup/main.dart';
import 'dart:async';
import 'package:test_linkup/components/voteButton/index.dart';
import 'package:test_linkup/screens/stingNomination/index.dart';

class VoteResult extends StatefulWidget {
  VoteResult({this.res, this.countLike, this.countDislike});
  final res;
  final int countDislike;
  final int countLike;
  @override
  _VoteResultState createState() => _VoteResultState();
}

class _VoteResultState extends State<VoteResult> {
  Timer _timer;
  int _start = 15;

  void startTimer() {
    _timer = new Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            widget.res
                ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StingNomination()),
                  );
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void deactivate() {
    super.deactivate();
    _timer.cancel();
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
                  children: icons
                      .map<Widget>(
                        (item) => Image(
                          image: AssetImage(item),
                          width: 40,
                          height: 40,
                        ),
                      )
                      .toList()),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Icon(
                          widget.res ? Icons.thumb_up : Icons.thumb_down,
                          color: widget.res
                              ? Color.fromRGBO(0, 138, 99, 1)
                              : Color.fromRGBO(206, 17, 65, 1),
                          size: 50,
                        ),
                      ),
                      Text(
                        "NOMINATION",
                        style: TextStyle(
                            color: widget.res
                                ? Color.fromRGBO(0, 138, 99, 1)
                                : Color.fromRGBO(206, 17, 65, 1),
                            fontFamily: "PaybAck",
                            fontSize: 50),
                      )
                    ],
                  ),
                  widget.res
                      ? Text(
                          "Succes",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 138, 99, 1),
                              fontFamily: "PaybAck",
                              fontSize: 50),
                        )
                      : Text(
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
                  widget.res
                      ? Text(
                          "Sting begins in",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "PaybAck",
                            fontSize: 30,
                          ),
                        )
                      : Text(
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
                  VoteButtons(
                    counterr: widget.countLike,
                    shadowColor: Color.fromRGBO(0, 78, 56, 1),
                    buttonColor: Color.fromRGBO(0, 138, 99, 1),
                    icon: Icons.thumb_up,
                  ),
                  VoteButtons(
                    counterr: widget.countDislike,
                    shadowColor: Color.fromRGBO(123, 7, 37, 1),
                    buttonColor: Color.fromRGBO(206, 17, 65, 1),
                    icon: Icons.thumb_down,
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
