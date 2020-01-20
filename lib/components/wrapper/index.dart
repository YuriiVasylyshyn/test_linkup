import 'package:flutter/material.dart';
import 'package:test_linkup/components/CoopOrSabButton/index.dart';
import 'package:test_linkup/components/hitmanScreen/index.dart';
import 'package:test_linkup/components/succesOrSabotage/index.dart';
import 'package:test_linkup/components/voteResult/index.dart';
import 'package:test_linkup/screens/accusationScreen/index.dart';
import 'package:test_linkup/screens/placeYourVote/index.dart';
import 'package:test_linkup/screens/stingNomination/index.dart';
import 'package:test_linkup/screens/voteScreen/index.dart';

class Wrapper extends StatefulWidget {
  Wrapper(
      {this.screen,
      this.res,
      this.countDislike,
      this.countLike,
      this.chosenPlayer,
      this.shadowColor,
      this.buttonColor,
      this.icon,
      this.text,
      this.onPressed});
  final screen;
  final res;
  final int countDislike;
  final int countLike;
  final chosenPlayer;
  final shadowColor;
  final buttonColor;
  final icon;
  final text;
  final onPressed;

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
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
          widget.screen == 'sting'
              ? StingNomination()
              : widget.screen == 'voteScreen'
                  ? VoteScreen()
                  : widget.screen == 'voteResult'
                      ? VoteResult(
                          res: widget.res,
                          countDislike: widget.countDislike,
                          countLike: widget.countLike,
                        )
                      : widget.screen == 'voteOrSting'
                          ? PlaceYourVote()
                          : widget.screen == 'coopOrSab'
                              ? CoopOrSab(
                                  shadowColor: widget.shadowColor,
                                  buttonColor: widget.buttonColor,
                                  icon: widget.icon,
                                  text: widget.text,
                                  onPressed: widget.onPressed,
                                )
                              : widget.screen == 'succOrSab'
                                  ? SuccesOrSabotage(res: widget.res)
                                  : widget.screen == 'accusScreen'
                                      ? AccusationScreen()
                                      : widget.screen == 'hitmanScreen'
                                          ? HitmanScreen(
                                              chosenPlayer: widget.chosenPlayer,
                                            )
                                          : Container()
        ],
      ),
    );
  }
}
