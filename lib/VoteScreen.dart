import 'package:flutter/material.dart';

class VoteScreen extends StatefulWidget {
  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image(
                    image: AssetImage('icons/menu.png'),
                    height: 45,
                    width: 45,
                  ),
                  Image(
                    image: AssetImage('icons/street.png'),
                    height: 45,
                    width: 45,
                  ),
                  Image(
                    image: AssetImage('icons/car.png'),
                    height: 45,
                    width: 45,
                  ),
                  Image(
                    image: AssetImage('icons/appartment.png'),
                    height: 45,
                    width: 45,
                  ),
                  Image(
                    image: AssetImage('icons/plate.png'),
                    height: 45,
                    width: 45,
                  ),
                  Image(
                    image: AssetImage('icons/hotel.png'),
                    height: 45,
                    width: 45,
                  ),
                  Image(
                    image: AssetImage('icons/docks.png'),
                    height: 45,
                    width: 45,
                  ),
                ],
              ),
              Text(
                "ROUND 6: DOCKS",
                style: TextStyle(
                  color: Color.fromRGBO(206, 17, 65, 1),
                  fontFamily: 'PaybAck',
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image(
                      image: AssetImage('icons/redcircle.png'),
                      height: 20,
                      width: 20,
                    ),
                    Image(
                      image: AssetImage('icons/redcircle.png'),
                      height: 20,
                      width: 20,
                    ),
                    Image(
                      image: AssetImage('icons/whitecircle.png'),
                      height: 20,
                      width: 20,
                    ),
                    Image(
                      image: AssetImage('icons/blackcircle.png'),
                      height: 20,
                      width: 20,
                    ),
                    Image(
                      image: AssetImage('icons/blackcircle.png'),
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
              Text(
                "STING NOMINATION",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PaybAck',
                  fontSize: 30,
                ),
              ),
              Container(
            height: 60.0,
            width: 274.0,
            margin: EdgeInsets.fromLTRB(0, 350, 0, 0),
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
              onPressed: () {},
              icon: Icon(
                Icons.arrow_right,
                color: Colors.white,
                size: 50,
              ),
              label: Text(
                'New Game',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Typewriter',
                  color: Colors.white,
                ),
              ),
              color: Color.fromRGBO(206, 17, 65, 1),
            ),
          ),
            ],
          ),
        ],
      ),
    );
  }
}