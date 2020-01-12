import 'package:flutter/material.dart';

class VoteButton extends StatelessWidget {
  VoteButton({this.vote, @required this.onPressed, this.img, this.name});
  final vote;
  final Function onPressed;
  final img;
  final name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 274,
      height: 60,
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 73, 144, 1),
            spreadRadius: 0.1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: RaisedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          vote ? Icons.check_box : Icons.check_box_outline_blank,
          color: vote ? Colors.white : Color.fromRGBO(82, 82, 82, 1),
          size: 30,
        ),
        label: Row(
          children: [
            Image(
              image: AssetImage(img),
              width: 45,
              height: 45,
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        color: vote
            ? Color.fromRGBO(0, 73, 144, 1)
            : Color.fromRGBO(42, 42, 42, 1),
      ),
    );
  }
}
