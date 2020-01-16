import 'package:flutter/material.dart';
import 'package:test_linkup/components/choosedPlayers/index.dart';
import 'package:test_linkup/constants/listsToUse/index.dart';
import 'package:test_linkup/screens/accusationScreen/index.dart';
import 'package:test_linkup/services/asyncStorage/index.dart';
import 'package:test_linkup/components/redButton/index.dart';

import '../../main.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    widget.res ? 'assets/success.png' : 'assets/fail.png'),
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
              Column(
                children: <Widget>[
                  Text(
                    widget.res ? 'success!' : 'sabotage',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'PaybAck',
                      fontSize: 40,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      widget.res
                          ? 'the sting operation was carried out successfully!'
                          : 'the sting operation was sabotaged!',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PaybAck',
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
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
              choosedPlayers != null
                  ? Wrap(
                      children: choosedPlayers
                          .map<Widget>((item) => ChoosedPlayers(
                                name: item["name"],
                                img: item["img"],
                              ))
                          .toList())
                  : Container(),
              RedButton(
                padding: false,
                text: 'Next',
                icon: Icons.arrow_right,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            widget.res ? AccusationScreen() : Home()),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
