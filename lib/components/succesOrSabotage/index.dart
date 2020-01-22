import 'package:flutter/material.dart';
import 'package:test_linkup/components/choosedPlayers/index.dart';

import 'package:test_linkup/components/wrapper/index.dart';
import 'package:test_linkup/main.dart';
import 'package:test_linkup/services/asyncStorage/index.dart';
import 'package:test_linkup/components/redButton/index.dart';
import 'package:test_linkup/services/navigation/index.dart';

class SuccesOrSabotage extends StatefulWidget {
  SuccesOrSabotage({this.res});
  final res;
  @override
  _SuccesOrSabotageState createState() => _SuccesOrSabotageState();
}

class _SuccesOrSabotageState extends State<SuccesOrSabotage> {
  var choosedPlayers;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var chosenPlayers =
        await getFromAsyncStorage('string', 'choosedPlayers', true);
    setState(() {
      choosedPlayers = chosenPlayers;
    });
  }

  void navigate() {
    navigationReset(context,
        widget.res ? Wrapper(screen: 'accusScreen', wallPaper: true) : Home());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                widget.res ? 'success!' : 'sabotage',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PaybAck',
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                widget.res
                    ? 'the sting operation was carried out successfully!'
                    : 'the sting operation was sabotaged!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PaybAck',
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Stack(
            children: <Widget>[
              Container(
                height: 130,
                width: 130,
                child: Image(
                  image: AssetImage('assets/icons/icon.png'),
                ),
              ),
              Positioned(
                top: 1,
                right: 1,
                child: Container(
                  height: 55,
                  width: 55,
                  child: Image(
                    image: AssetImage(widget.res
                        ? 'assets/icons/checkTrue.png'
                        : 'assets/icons/checkFalse.png'),
                  ),
                ),
              ),
            ],
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
          padding: EdgeInsets.only(top: 20),
          child: RedButton(
            padding: false,
            text: 'Next',
            icon: Icons.arrow_right,
            onPressed: () {
              navigate();
            },
          ),
        ),
      ],
    );
  }
}
