import 'package:flutter/material.dart';

class VoteButtons extends StatefulWidget {
  VoteButtons(
      {this.shadowColor,
      this.icon,
      this.buttonColor,
      this.onPressed,
      this.counterr});
  final shadowColor;
  final icon;
  final buttonColor;
  final Function onPressed;
  final counterr;

  @override
  _VoteButtonsState createState() => _VoteButtonsState();
}

class _VoteButtonsState extends State<VoteButtons> {
  @override
  Widget build(BuildContext context) {
    print(widget.counterr);
    return Stack(
      children: <Widget>[
        Container(
          height: 117,
          width: 117,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: widget.shadowColor,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: RaisedButton(
            onPressed: widget.onPressed,
            child: Icon(
              widget.icon,
              color: Colors.white,
              size: 50,
            ),
            shape: CircleBorder(),
            color: widget.buttonColor,
          ),
        ),
        Positioned(
          top: 1,
          right: 1,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(50, 50, 50, 1),
            ),
            child: Center(
              child: Text(
                "${widget.counterr}",
                style: TextStyle(
                  fontFamily: "PaybAck",
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
