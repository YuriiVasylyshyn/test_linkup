import 'package:flutter/material.dart';
import 'package:test_linkup/components/header/index.dart';
import 'package:test_linkup/components/hitmanScreen/index.dart';
import 'package:test_linkup/components/succesOrSabotage/index.dart';
import 'package:test_linkup/components/voteResult/index.dart';
import 'package:test_linkup/screens/accusationScreen/index.dart';
import 'package:test_linkup/screens/placeYourVote/index.dart';
import 'package:test_linkup/screens/stingNomination/index.dart';
import 'package:test_linkup/screens/voteScreen/index.dart';

class Wrapper extends StatefulWidget {
  Wrapper({
    this.screen,
    this.res,
    this.countDislike,
    this.countLike,
    this.chosenPlayer,
  });
  final screen;
  final res;
  final int countDislike;
  final int countLike;
  final chosenPlayer;

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  switchFunc() {
    switch (widget.screen) {
      case 'sting':
        return StingNomination();
        break;
      case 'voteScreen':
        return VoteScreen();
        break;
      case 'voteResult':
        return VoteResult(
          res: widget.res,
          countDislike: widget.countDislike,
          countLike: widget.countLike,
        );
        break;
      case 'voteOrSting':
        return PlaceYourVote();
        break;
      case 'succOrSab':
        return SuccesOrSabotage(res: widget.res);
        break;
      case 'accusScreen':
        return AccusationScreen();
        break;
      case 'hitmanScreen':
        return HitmanScreen(
          chosenPlayer: widget.chosenPlayer,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.screen == 'succOrSab') {
      print('[screeN] ${widget.screen}');
      print('[RES] ${widget.res}');
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(5), child: Header()),
            switchFunc()
          ],
        ),
      ),
    );
  }
}
