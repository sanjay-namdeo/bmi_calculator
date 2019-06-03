import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'child_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color activeColor = Color(0xFF1D1E33);
const Color inactiveColor = Color(0xFF111238);
const Color bottomContainerColor = Color(0xFFEB1555);

const bottomContainerHeight = 80.0;

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleActiveColor;
  Color femaleActiveColor;

  updateGender(Gender selectedGender) {
    if (selectedGender == Gender.Male) {
      maleActiveColor =
          (maleActiveColor == inactiveColor) ? activeColor : inactiveColor;
      femaleActiveColor =
          (maleActiveColor == activeColor) ? inactiveColor : activeColor;
    } else {
      femaleActiveColor =
          (femaleActiveColor == inactiveColor) ? activeColor : inactiveColor;
      maleActiveColor =
          (femaleActiveColor == activeColor) ? inactiveColor : activeColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('Male tapped');
                      setState(() {
                        updateGender(Gender.Male);
                      });
                    },
                    child: ReusableCard(
                      color: maleActiveColor,
                      childCard: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateGender(Gender.Female);
                      });
                    },
                    child: ReusableCard(
                      color: femaleActiveColor,
                      childCard: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeColor,
              childCard: IconContent(
                icon: FontAwesomeIcons.mars,
                label: 'MALE',
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: activeColor,
                    childCard: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeColor,
                    childCard: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            height: bottomContainerHeight,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
