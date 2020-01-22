import 'package:flutter/material.dart';
import 'package:test_linkup/components/wrapper/index.dart';
import 'package:test_linkup/services/navigation/index.dart';

class CoopOrSab extends StatefulWidget {
  CoopOrSab(
      {this.shadowColor, this.buttonColor, this.icon, this.text, this.push});
  final shadowColor;
  final buttonColor;
  final icon;
  final text;
  final push;
  @override
  _CoopOrSabState createState() => _CoopOrSabState();
}

class _CoopOrSabState extends State<CoopOrSab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            offset: Offset(0, 2),
            color: widget.shadowColor,
          ),
        ],
      ),
      child: RaisedButton(
        shape: CircleBorder(),
        color: widget.buttonColor,
        padding: EdgeInsets.only(bottom: 15),
        onPressed: () {
          navigationReset(
              context,
              Wrapper(
                res: widget.push,
                screen: 'succOrSab',
                wallPaper: widget.push ? false : true,
              ));
        },
        child: Padding(
          padding: EdgeInsets.only(top: 45),
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage(widget.icon),
                color: Colors.white,
                height: 50,
                width: 50,
              ),
              Text(
                widget.text,
                style: TextStyle(
                    fontFamily: "PaybAck", fontSize: 25, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
