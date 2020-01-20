import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_linkup/components/redButton/index.dart';
import 'package:test_linkup/constants/listsToUse/index.dart';
import 'package:test_linkup/services/asyncStorage/index.dart';

import '../../main.dart';

class HitmanScreen extends StatefulWidget {
  HitmanScreen({this.chosenPlayer});
  final chosenPlayer;

  @override
  _HitmanScreenState createState() => _HitmanScreenState();
}

class _HitmanScreenState extends State<HitmanScreen> {
  Timer _timer;
  int _start = 5;
  var choosedHitman;
  var aliveOrMurdered = true;
  bool timerEnd = false;

  void startTimer() {
    _timer = new Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timerEnd = true;
            if ((choosedHitman['profiler'] == true &&
                    widget.chosenPlayer == true) ||
                choosedHitman['informant'] == true &&
                    widget.chosenPlayer == false) {
              aliveOrMurdered = false;
            } else {
              aliveOrMurdered = true;
            }
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
                image: AssetImage(
                  'assets/bg2.jpg',
                ),
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
                    decoration: timerEnd && aliveOrMurdered
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
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
                        Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(500),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    timerEnd && !aliveOrMurdered
                                        ? Colors.grey
                                        : Colors.white.withOpacity(0),
                                    BlendMode.color),
                                child: Image(
                                  image: AssetImage(
                                    choosedHitman["img"],
                                  ),
                                  height: 143,
                                  width: 143,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              top: aliveOrMurdered ? 5 : 50,
                              left: aliveOrMurdered ? 2 : 0,
                              child: RotationTransition(
                                  turns: AlwaysStoppedAnimation(340 / 360),
                                  child: timerEnd
                                      ? aliveOrMurdered
                                          ? Image(
                                              image: AssetImage(
                                                  'assets/alive!.png'),
                                              height: 70,
                                              width: 90,
                                            )
                                          : Text(
                                              'murdered!',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 32.5,
                                                fontFamily: 'PaybAck',
                                                color: Color.fromRGBO(
                                                    206, 17, 65, 1),
                                              ),
                                            )
                                      : null),
                            ),
                          ],
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
                  : Container(),
              timerEnd
                  ? RedButton(
                      padding: true,
                      icon: null,
                      text: 'Next',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                    )
                  : Text(
                      '$_start',
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'PaybAck',
                          color: Colors.white),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
