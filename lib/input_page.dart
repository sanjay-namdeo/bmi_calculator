import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'child_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int selectedHeight = 183;
  int selectedWeight = 74;
  int selectedAge = 19;

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
                  child: ReusableCard(
                    onUserTap: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    color: selectedGender == Gender.Male
                        ? activeColor
                        : inactiveColor,
                    childCard: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onUserTap: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    color: selectedGender == Gender.Female
                        ? activeColor
                        : inactiveColor,
                    childCard: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            childCard: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      selectedHeight.toString(),
                      style: mainTextStyle,
                    ),
                    Text(
                      'cm',
                      style: labelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  onChanged: (newHeight) {
                    setState(() {
                      selectedHeight = newHeight.toInt();
                    });
                  },
                  value: selectedHeight.toDouble(),
                  min: 120,
                  max: 220,
                  activeColor: Colors.red,
                  inactiveColor: Colors.pink,
                )
              ],
            ),
            color: inactiveColor,
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: inactiveColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          selectedWeight.toString(),
                          style: mainTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            weightContainer(
                                iconToShow: Icons.add,
                                onUserTap: () {
                                  setState(() {
                                    selectedWeight++;
                                  });
                                }),
                            weightContainer(
                                iconToShow: Icons.remove,
                                onUserTap: () {
                                  setState(() {
                                    selectedWeight--;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: inactiveColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          selectedAge.toString(),
                          style: mainTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            weightContainer(
                                iconToShow: Icons.add,
                                onUserTap: () {
                                  setState(() {
                                    selectedAge++;
                                  });
                                }),
                            weightContainer(
                                iconToShow: Icons.remove,
                                onUserTap: () {
                                  setState(() {
                                    selectedAge--;
                                  });
                                }),
                          ],
                        )
                      ],
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
            child: Center(
              child: Text(
                'CALCULATE YOUR BMI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container weightContainer({Function onUserTap, IconData iconToShow}) {
    return Container(
      width: 50.0,
      height: 50.0,
      padding: EdgeInsets.all(0.0),
      decoration: BoxDecoration(shape: BoxShape.circle, color: activeColor),
      child: GestureDetector(
        child: Icon(iconToShow),
        onTap: onUserTap,
      ),
    );
  }
}
