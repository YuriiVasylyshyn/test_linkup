import 'package:flutter/material.dart';
import 'package:test_linkup/constants/listsToUse/index.dart';
import 'package:test_linkup/components/CoopOrSabButton/index.dart';

class PlaceYourVote extends StatefulWidget {
  @override
  _PlaceYourVoteState createState() => _PlaceYourVoteState();
}

class _PlaceYourVoteState extends State<PlaceYourVote> {
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
            Column(children: <Widget>[
              Text(
                "place your",
                style: TextStyle(
                    fontFamily: "PaybAck", fontSize: 33, color: Colors.white),
              ),
              Text(
                "vote!",
                style: TextStyle(
                    fontFamily: "PaybAck", fontSize: 33, color: Colors.white),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CoopOrSab(
                    shadowColor: Color.fromRGBO(22, 78, 135, 1),
                    buttonColor: Color.fromRGBO(31, 92, 154, 1),
                    icon: 'assets/icons/fbi_icon.png',
                    text: 'cooperate',
                    onPressed: true),
                CoopOrSab(
                  shadowColor: Color.fromRGBO(113, 4, 31, 1),
                  buttonColor: Color.fromRGBO(206, 17, 65, 1),
                  icon: 'assets/icons/icon_incognito.png',
                  text: 'sabotage',
                  onPressed: false,
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
