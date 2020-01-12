import 'package:flutter/material.dart';
import 'dart:math';

import 'package:test_linkup/VoteScreen.dart';
import 'package:test_linkup/button.dart';

class StingNomination extends StatefulWidget {
  @override
  createState() => new _StingNominationState();
}

class _StingNominationState extends State<StingNomination> {
  int randomnum;

  Random rand = Random();

  int randNum(n) {
    return randomnum = rand.nextInt(n) + 1;
  }

  _StingNominationState() {
    this.randomnum = randNum(5);
  }

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

  void votefunc(id) {
    setState(() {
      if (choosedPlayers.contains(id)) {
        choosedPlayers.remove(id);
      } else
        choosedPlayers.add(id);
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
                      Image(
                        image: AssetImage(
                          'assets/img2.png',
                        ),
                        width: 45,
                        height: 45,
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
                          .map((item) => VoteButton(
                              vote: choosedPlayers.contains(item["id"]),
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
                          ? () {
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
