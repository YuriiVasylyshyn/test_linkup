import 'package:flutter/material.dart';
import 'package:test_linkup/components/choosedPlayers/index.dart';
import 'package:test_linkup/components/voteButton/index.dart';
import 'dart:async';

import 'package:test_linkup/components/wrapper/index.dart';
import 'package:test_linkup/services/asyncStorage/index.dart';

import 'package:test_linkup/constants/listsToUse/index.dart';
import 'package:test_linkup/services/navigation/index.dart';

class VoteScreen extends StatefulWidget {
  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  int likeCount = 0;
  int dislikeCount = 0;

  Timer _timer;
  int _start = 5;

  var leader2;
  var choosedPlayers;

  incrementLike() {
    setState(() {
      likeCount++;
    });
  }

  incrementDislike() {
    setState(() {
      dislikeCount++;
    });
  }

  void startTimer() {
    _timer = new Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            navigationReset(
                context,
                Wrapper(
                  screen: 'voteResult',
                  res: likeCount > dislikeCount,
                  countLike: likeCount,
                  countDislike: dislikeCount,
                  wallPaper: true,
                ));

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => Wrapper(
            //             screen: 'voteResult',
            //             res: likeCount > dislikeCount,
            //             countLike: likeCount,
            //             countDislike: dislikeCount,
            //             wallPaper: true,
            //           )),
            // );
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

  @override
  void dispose() {
    super.dispose();
  }

  getData() async {
    var date = await getFromAsyncStorage('string', 'leader', true);
    var chosenPlayers =
        await getFromAsyncStorage('string', 'choosedPlayers', true);
    setState(() {
      leader2 = date;
      choosedPlayers = chosenPlayers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          "ROUND 6: DOCKS",
          style: TextStyle(
            color: Color.fromRGBO(206, 17, 65, 1),
            fontFamily: 'PaybAck',
            fontSize: 30,
          ),
        ),
        Text(
          "Timer: $_start",
          style: TextStyle(
            color: Color.fromRGBO(206, 17, 65, 1),
            fontFamily: 'PaybAck',
            fontSize: 30,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: icons2
                  .map<Widget>(
                    (item) => Image(
                      image: AssetImage(item),
                      width: 20,
                      height: 20,
                    ),
                  )
                  .toList()),
        ),
        Text(
          "STING NOMINATION",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'PaybAck',
            fontSize: 40,
          ),
        ),
        leader2 != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
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
                    margin: EdgeInsets.all(10),
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
            : Container(),
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            "OPERATORS",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'PaybAck',
              fontSize: 30,
            ),
          ),
        ),
        choosedPlayers != null
            ? Wrap(
                children: choosedPlayers
                    .map<Widget>((item) => ChoosedPlayers(
                          name: item["name"],
                          img: item["img"],
                        ))
                    .toList())
            : Container(),
        Padding(
          padding: EdgeInsets.only(top: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              VoteButtons(
                counterr: likeCount,
                shadowColor: Color.fromRGBO(0, 78, 56, 1),
                buttonColor: Color.fromRGBO(0, 138, 99, 1),
                icon: Icons.thumb_up,
                onPressed: incrementLike,
              ),
              VoteButtons(
                counterr: dislikeCount,
                shadowColor: Color.fromRGBO(123, 7, 37, 1),
                buttonColor: Color.fromRGBO(206, 17, 65, 1),
                icon: Icons.thumb_down,
                onPressed: incrementDislike,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
