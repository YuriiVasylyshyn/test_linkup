import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';

import 'package:test_linkup/VoteScreen.dart';
import 'package:test_linkup/button.dart';
import 'package:test_linkup/services/asyncStorage.dart';

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

  List<String> icons = [
    "icons/menu.png",
    "icons/street.png",
    "icons/car.png",
    "icons/appartment.png",
    "icons/plate.png",
    "icons/hotel.png",
    "icons/docks.png"
  ];

  List<String> icons2 = [
    "icons/redcircle.png",
    "icons/redcircle.png",
    "icons/whitecircle.png",
    "icons/blackcircle.png",
    "icons/blackcircle.png"
  ];

  List players = [
    {"id": 1, "name": "Alan", "img": "assets/img1.png"},
    {"id": 2, "name": "Bob", "img": "assets/img2.png"},
    {"id": 3, "name": "Richard", "img": "assets/img1.png"},
    {"id": 4, "name": "Andrew", "img": "assets/img2.png"},
    {"id": 5, "name": "Adam", "img": "assets/img1.png"},
    {"id": 6, "name": "Kate", "img": "assets/img8.png"},
    {"id": 7, "name": "Loren", "img": "assets/img9.png"},
    {"id": 8, "name": "Helen", "img": "assets/img8.png"},
    {"id": 9, "name": "Sally", "img": "assets/img9.png"},
    {"id": 10, "name": "Polly", "img": "assets/img8.png"}
  ];

  List choosedPlayers = [];

  void initState() {
    super.initState();
    setState(() {
      leader = players[rand.nextInt(10)];
    });
  }

  void votefunc(id) {
    var a = players.firstWhere((players) => players["id"] == id);
    setState(() {
      if (choosedPlayers.contains(a)) {
        choosedPlayers.remove(a);
      } else
        choosedPlayers.add(a);
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
          ListView(
            children: <Widget>[
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
                  Container(
                    margin: EdgeInsets.all(3),
                    child: Text(
                      "ROUND 2: AUTOMOBILE",
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
                      "STING NOMINATION",
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
                          image: AssetImage(leader["img"]),
                          height: 45,
                          width: 45,
                        ),
                      ),
                      Text(
                        leader["name"],
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
                        TextSpan(text: "NOMINATE "),
                        TextSpan(
                          text: '$randomnum',
                          style: TextStyle(
                            color: Color.fromRGBO(206, 17, 65, 1),
                          ),
                        ),
                        TextSpan(text: " PLAYERS"),
                      ],
                    ),
                  ),
                  Column(
                      children: players
                          .map<Widget>((item) => VoteButton(
                              vote: choosedPlayers.contains(item),
                              name: item["name"],
                              img: item["img"],
                              onPressed: () {
                                votefunc(item["id"]);
                              }))
                          .toList()),
                  Container(
                    margin: EdgeInsets.all(7),
                    height: 60.0,
                    width: 274.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(123, 7, 37, 1),
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: RaisedButton(
                      onPressed: choosedPlayers.length == randomnum
                          ? () async {
                              await addToAsyncStorage('string',
                                  'choosedPlayers', jsonEncode(choosedPlayers));
                              await addToAsyncStorage(
                                  'string', 'leader', jsonEncode(leader));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VoteScreen()),
                              );
                            }
                          : null,
                      child: Text(
                        'Nominate',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Typewriter',
                          color: Colors.white,
                        ),
                      ),
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
