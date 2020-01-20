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
    return Stack(
      children: <Widget>[
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                offset: Offset(0, 2),
                color: widget.shadowColor,
              ),
            ],
          ),
          child: RaisedButton(
              padding: EdgeInsets.only(bottom: 15),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Wrapper(
                            res: widget.onPressed == true,
                            screen: 'succOrSab',
                          )),
                );
              },
              child: Container(
                child: Image(
                  image: AssetImage(widget.icon),
                  color: Colors.white,
                  height: 45,
                  width: 45,
                ),
              ),
              shape: CircleBorder(),
              color: widget.buttonColor),
        ),
        Positioned(
          right: 33,
          bottom: 30,
          child: Text(
            widget.text,
            style: TextStyle(
                fontFamily: "PaybAck", fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
