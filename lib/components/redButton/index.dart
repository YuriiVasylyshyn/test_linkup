import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  RedButton({this.text, this.icon, @required this.onPressed, this.padding});
  final text;
  final padding;
  final icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      height: 60.0,
      width: 274.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(123, 7, 37, 1),
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: RaisedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
          size: 50,
        ),
        label: Padding(
          padding: EdgeInsets.only(right: padding ? 40 : 0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Typewriter',
              color: Colors.white,
            ),
          ),
        ),
        color: Color.fromRGBO(206, 17, 65, 1),
      ),
    );
  }
}
