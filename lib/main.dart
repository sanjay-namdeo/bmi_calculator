import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: Scaffold(
        body: InputPage(),
        backgroundColor: Color(0xFF090C22),
      ),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: BaseContainer(Icons.ac_unit, Colors.red, 'MALE'),
              ),
              Expanded(
                child: BaseContainer(Icons.check, Colors.grey, 'FEMALE'),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            flex: 1,
            child: BaseContainer(Icons.ac_unit, Colors.pink, 'HEIGHT'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child:
                    BaseContainer(Icons.access_time, Colors.black38, 'WEIGHT'),
              ),
              Expanded(
                flex: 1,
                child:
                    BaseContainer(Icons.accessible_forward, Colors.grey, 'AGE'),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 50.0,
            width: double.infinity,
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}

class BaseContainer extends StatelessWidget {
  final IconData inputIcon;
  final Color inputColor;
  final String iconLabel;

  BaseContainer(this.inputIcon, this.inputColor, this.iconLabel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
        color: Color(0xFF1D1F33),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              inputIcon,
              color: Colors.white,
            ),
            iconSize: 50.0,
            onPressed: () {},
          ),
          Center(
              child: Text(
            iconLabel,
            style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
