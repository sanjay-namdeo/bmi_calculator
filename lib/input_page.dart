import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'child_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'navigation_button.dart';

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
                        ? kActiveColor
                        : kInactiveColor,
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
                        ? kActiveColor
                        : kInactiveColor,
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
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      selectedHeight.toString(),
                      style: kMainTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
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
            color: kInactiveColor,
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kInactiveColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          selectedWeight.toString(),
                          style: kMainTextStyle,
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
                    color: kInactiveColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          selectedAge.toString(),
                          style: kMainTextStyle,
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
          new NavigatorButton(
            buttonName: 'CALCULATE YOUR BMI',
            navigateTo: () {
              Navigator.pushNamed(
                context,
                'result_page',
              );
            },
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
      decoration: BoxDecoration(shape: BoxShape.circle, color: kActiveColor),
      child: GestureDetector(
        child: Icon(iconToShow),
        onTap: onUserTap,
      ),
    );
  }
}
