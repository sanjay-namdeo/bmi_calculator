import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class NavigatorButton extends StatelessWidget {
  NavigatorButton({this.navigateTo, this.buttonName});

  final String buttonName;

  final Function navigateTo;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        child: FlatButton(
          onPressed: navigateTo,
          child: Text(
            buttonName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ));
  }
}
