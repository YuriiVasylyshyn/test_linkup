import 'package:flutter/material.dart';
import 'package:test_linkup/components/wrapper/index.dart';

class CoopOrSab extends StatefulWidget {
  CoopOrSab(
      {this.shadowColor,
      this.buttonColor,
      this.icon,
      this.text,
      this.onPressed});
  final shadowColor;
  final buttonColor;
  final icon;
  final text;
  final onPressed;
  @override
  _CoopOrSabState createState() => _CoopOrSabState();
}

class _CoopOrSabState extends State<CoopOrSab> {
  @override
  Widget build(BuildContext context) {
    print('[OMPERSS] ${widget.onPressed}');
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
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Wrapper(
                      res: widget.onPressed,
                      screen: 'succOrSab',
                    )),
          );
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
