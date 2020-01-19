import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_linkup/components/hitmanScreen/index.dart';
import 'package:test_linkup/components/redButton/index.dart';
import 'package:test_linkup/components/usersCheckButton/index.dart';
import 'package:test_linkup/constants/listsToUse/index.dart';
import 'package:test_linkup/services/asyncStorage/index.dart';

class AccusationScreen extends StatefulWidget {
  void remove() async {
    await removeFromAsyncStorage("choosedPlayers");
  }

  void dispose() {
    remove();
  }

  @override
  _AccusationScreenState createState() => _AccusationScreenState();
}

class _AccusationScreenState extends State<AccusationScreen> {
  Object choosedPlayer;
  bool check = true;

  void votefunc(item) {
    setState(() {
      choosedPlayer = item;
    });
  }

  void profButton() {
    setState(() {
      check = true;
      print(check);
    });
  }

  void infButton() {
    setState(() {
      check = false;
      print(check);
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
                    Text(
                      'make an \n accusation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'PaybAck',
                          fontSize: 40,
                          color: Colors.white),
                    ),
                    Text(
                      'Guess the Informant or Profiler \n below to win the game!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 158,
                          height: 65.5,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(206, 17, 65, 1),
                                spreadRadius: 0.1,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: RaisedButton(
                            color: Color.fromRGBO(42, 42, 42, 1),
                            disabledColor: Color.fromRGBO(206, 17, 65, 1),
                            child: Text(
                              'profiler',
                              style: TextStyle(
                                  fontFamily: 'PaybAck',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic),
                            ),
                            onPressed: check ? null : profButton,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(1),
                          width: 158,
                          height: 65.5,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(206, 17, 65, 1),
                                spreadRadius: 0.1,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: RaisedButton(
                            color: Color.fromRGBO(42, 42, 42, 1),
                            disabledColor: Color.fromRGBO(206, 17, 65, 1),
                            child: Text(
                              'informant',
                              style: TextStyle(
                                  fontFamily: 'PaybAck',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic),
                            ),
                            onPressed: check ? infButton : null,
                          ),
                        ),
                      ],
                    ),
                    Column(
                        children: players
                            .map<Widget>((item) => VoteButton(
                                vote: choosedPlayer == item,
                                name: item['name'],
                                img: item['img'],
                                iconChange: false,
                                onPressed: () {
                                  votefunc(item);
                                }))
                            .toList()),
                    RedButton(
                      padding: true,
                      text: 'Guess',
                      icon: null,
                      onPressed: () async {
                        await addToAsyncStorage('string', 'choosedPlayer',
                            jsonEncode(choosedPlayer));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HitmanScreen(
                                      chosenPlayer: check,
                                    )));
                      },
                    ),
                  ]),
            ],
          ),
        ],
      ),
    );
  }
}
