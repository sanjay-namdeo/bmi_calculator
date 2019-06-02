import 'package:flutter/material.dart';

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
