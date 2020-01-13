import 'package:flutter/material.dart';

class ChoosedPlayers extends StatefulWidget {
  ChoosedPlayers ({this.name, this.img, this.id});
  final name;
  final img;
  final id;
  @override
  _ChoosedPlayersState createState() => _ChoosedPlayersState();
}

class _ChoosedPlayersState extends State<ChoosedPlayers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        color: Color.fromRGBO(42, 42, 42, 1),
        borderRadius: BorderRadius.circular(30)
      ),
      width: 163.5,
      height: 52.5,
      
      child: Row(
        children: <Widget>[
         Padding(
           padding: EdgeInsets.all(8),
         child: Image(
            image: AssetImage(widget.img),
            width: 45,
            height: 45,
          ),),
          Text(widget.name,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            
          ),),
        ],
      ),
    );
  }
}
