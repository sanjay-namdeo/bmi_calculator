import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class AddRemoveButton extends StatelessWidget {
  AddRemoveButton({this.onUserTap, this.iconToShow});

  final Function onUserTap;
  final IconData iconToShow;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onUserTap,
        fillColor: kButtonColor,
        child: Icon(iconToShow),
        elevation: 10.0,
        shape: CircleBorder(),
        splashColor: kBottomContainerColor,
        constraints: BoxConstraints.tightFor(
          width: 40.0,
          height: 40.0,
        ));
  }
}
