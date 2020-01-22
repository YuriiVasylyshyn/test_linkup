import 'package:flutter/material.dart';
import 'package:test_linkup/components/CoopOrSabButton/index.dart';

class PlaceYourVote extends StatefulWidget {
  @override
  _PlaceYourVoteState createState() => _PlaceYourVoteState();
}

class _PlaceYourVoteState extends State<PlaceYourVote> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 50, bottom: 40),
          child: Column(children: <Widget>[
            Text(
              "place your",
              style: TextStyle(
                  fontFamily: "PaybAck", fontSize: 40, color: Colors.white),
            ),
            Text(
              "vote!",
              style: TextStyle(
                  fontFamily: "PaybAck", fontSize: 40, color: Colors.white),
            ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.only(top: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CoopOrSab(
                shadowColor: Color.fromRGBO(22, 78, 135, 1),
                buttonColor: Color.fromRGBO(31, 92, 154, 1),
                icon: 'assets/icons/fbi_icon.png',
                text: 'cooperate',
                push: true,
              ),
              CoopOrSab(
                shadowColor: Color.fromRGBO(113, 4, 31, 1),
                buttonColor: Color.fromRGBO(206, 17, 65, 1),
                icon: 'assets/icons/icon_incognito.png',
                text: 'sabotage',
                push: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
