import 'package:flutter/material.dart';
import 'base_container.dart';

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
