import 'package:flutter/material.dart';
import 'package:test_linkup/components/redButton/index.dart';
import 'package:test_linkup/components/wrapper/index.dart';
import 'dart:math';
import 'dart:convert';

import 'package:test_linkup/components/usersCheckButton/index.dart';
import 'package:test_linkup/services/asyncStorage/index.dart';

import 'package:test_linkup/constants/listsToUse/index.dart';
import 'package:test_linkup/services/navigation/index.dart';

class StingNomination extends StatefulWidget {
  @override
  createState() => new _StingNominationState();
}

class _StingNominationState extends State<StingNomination> {
  int randomnum;
  var leader;
  Random rand = Random();

  int randNum(n) {
    return randomnum = rand.nextInt(n) + 1;
  }

  _StingNominationState() {
    this.randomnum = randNum(5);
  }

  List choosedPlayers = [];

  void initState() {
    super.initState();
    setState(() {
      leader = players[rand.nextInt(10)];
    });
  }

  void votefunc(id) {
    var a = players.firstWhere((players) => players['id'] == id);
    setState(() {
      if (choosedPlayers.contains(a)) {
        choosedPlayers.remove(a);
      } else
        choosedPlayers.add(a);
    });
  }

  void navigate() {
    setState(() async {
      await addToAsyncStorage(
          'string', 'choosedPlayers', jsonEncode(choosedPlayers));
      await addToAsyncStorage('string', 'leader', jsonEncode(leader));
      navigationReset(
          context,
          Wrapper(
            screen: 'voteScreen',
            wallPaper: true,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(3),
          child: Text(
            'ROUND 2: AUTOMOBILE',
            style: TextStyle(
              color: Color.fromRGBO(206, 17, 65, 1),
              fontFamily: 'PaybAck',
              fontSize: 30,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
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
                .toList(),
          ),
        ),
        Container(
          margin: EdgeInsets.all(3),
          child: Text(
            'STING NOMINATION',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'PaybAck',
              fontSize: 30,
            ),
          ),
        ),
        Row(
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
                image: AssetImage(leader['img']),
                height: 45,
                width: 45,
              ),
            ),
            Text(
              leader['name'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'PaybAck',
              fontSize: 30,
            ),
            children: [
              TextSpan(text: 'NOMINATE '),
              TextSpan(
                text: '$randomnum',
                style: TextStyle(
                  color: Color.fromRGBO(206, 17, 65, 1),
                ),
              ),
              TextSpan(text: ' PLAYERS'),
            ],
          ),
        ),
        Column(
            children: players
                .map<Widget>((item) => VoteButton(
                    vote: choosedPlayers.contains(item),
                    name: item['name'],
                    img: item['img'],
                    iconChange: true,
                    onPressed: () {
                      votefunc(item['id']);
                    }))
                .toList()),
        RedButton(
          padding: true,
          icon: null,
          text: 'Nominate',
          onPressed: choosedPlayers.length == randomnum ? navigate : null,
        ),
      ],
    );
  }
}
