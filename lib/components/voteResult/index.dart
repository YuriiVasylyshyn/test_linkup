import 'package:flutter/material.dart';
import 'package:test_linkup/components/choosedPlayers/index.dart';
import 'dart:async';
import 'package:test_linkup/components/voteButton/index.dart';
import 'package:test_linkup/components/wrapper/index.dart';
import 'package:test_linkup/services/asyncStorage/index.dart';

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
  int _start = 5;

  var choosedPlayers;

  void startTimer() {
    _timer = new Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Wrapper(
                        screen: widget.res ? 'voteOrSting' : 'sting',
                      )),
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
    getData();
    startTimer();
  }

  @override
  void deactivate() {
    super.deactivate();
    _timer.cancel();
  }

  void remove() async {
    await removeFromAsyncStorage("choosedPlayers");
    await removeFromAsyncStorage('leader2');
  }

  getData() async {
    var chosenPlayers =
        await getFromAsyncStorage('string', 'choosedPlayers', true);
    setState(() {
      choosedPlayers = chosenPlayers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
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
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    widget.res ? 'Succes' : 'fails',
                    style: TextStyle(
                        color: widget.res
                            ? Color.fromRGBO(0, 138, 99, 1)
                            : Color.fromRGBO(206, 17, 65, 1),
                        fontFamily: "PaybAck",
                        fontSize: 50),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  widget.res ? 'Sting begins in' : 'Next nomination in',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PaybAck",
                    fontSize: 35,
                  ),
                ),
                Text(
                  "$_start",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PaybAck",
                    fontSize: 90,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
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
            ),
            choosedPlayers != null
                ? Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Wrap(
                        children: choosedPlayers
                            .map<Widget>((item) => ChoosedPlayers(
                                  name: item["name"],
                                  img: item["img"],
                                ))
                            .toList()))
                : Container(),
          ],
        )
      ],
    );
  }
}
