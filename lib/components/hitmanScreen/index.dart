import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_linkup/components/choosedPlayers/index.dart';
import 'package:test_linkup/components/redButton/index.dart';
import 'package:test_linkup/constants/listsToUse/index.dart';
import 'package:test_linkup/services/asyncStorage/index.dart';

import '../../main.dart';

class HitmanScreen extends StatefulWidget {
  HitmanScreen({this.chosenPlayer, this.alive, this.murdered});
  final chosenPlayer;
  final alive;
  final murdered;
  @override
  _HitmanScreenState createState() => _HitmanScreenState();
}

class _HitmanScreenState extends State<HitmanScreen> {
  Timer _timer;
  int _start = 5;
  var choosedHitman;
  void startTimer() {
    _timer = new Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
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
    getData();
    startTimer();
  }

  @override
  void deactivate() {
    super.deactivate();
    _timer.cancel();
  }

  getData() async {
    var hitman = await getFromAsyncStorage('string', 'choosedPlayer', true);

    setState(() {
      choosedHitman = hitman;
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
                  children: icons
                      .map<Widget>(
                        (item) => Image(
                          image: AssetImage(item),
                          width: 40,
                          height: 40,
                        ),
                      )
                      .toList()),
              Text(
                'hitman',
                style: TextStyle(
                    fontFamily: 'PaybAck', fontSize: 40, color: Colors.white),
              ),
              Text(
                'Congratulations FBI for \n comleting 4 sting \n operations!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'PaybAck', fontSize: 20, color: Colors.white),
              ),
              Text(
                widget.chosenPlayer ? 'profiler' : 'informant',
                style: TextStyle(
                    decoration:
                        widget.alive ? TextDecoration.lineThrough : null,
                    decorationColor: Color.fromRGBO(206, 17, 65, 1),
                    decorationThickness: 3,
                    fontFamily: 'PaybAck',
                    fontSize: 30,
                    color: Colors.white),
              ),
              choosedHitman != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Image(
                            image: AssetImage(choosedHitman["img"]),
                            height: 142.5,
                            width: 142.5,
                          ),
                        ),
                        Text(
                          choosedHitman["name"],
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
              Text(
                '$_start',
                style: TextStyle(
                    fontSize: 50, fontFamily: 'PaybAck', color: Colors.white),
              ),
              RedButton(
                padding: false,
                icon: Icons.arrow_right,
                text: 'next',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
