import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'child_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'navigation_button.dart';
import 'add_remove_button.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.Male;
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
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8d8E98),
                      thumbColor: kSliderThumbColor,
                      overlayColor: kSliderOverlayActiveColor,
                      activeTickMarkColor: Colors.white,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    onChanged: (newHeight) {
                      setState(() {
                        selectedHeight = newHeight.round();
                      });
                    },
                    value: selectedHeight.toDouble(),
                    min: 120,
                    max: 220,
                    //activeColor: Colors.red,
                    //inactiveColor: Colors.pink,
                  ),
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
                    color: kActiveColor,
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
                            AddRemoveButton(
                                iconToShow: Icons.add,
                                onUserTap: () {
                                  setState(() {
                                    selectedWeight++;
                                  });
                                }),
                            AddRemoveButton(
                                iconToShow: Icons.remove,
                                onUserTap: () {
                                  setState(() {
                                    selectedWeight--;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveColor,
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
                            AddRemoveButton(
                                iconToShow: Icons.add,
                                onUserTap: () {
                                  setState(() {
                                    selectedAge++;
                                  });
                                }),
                            AddRemoveButton(
                                iconToShow: Icons.remove,
                                onUserTap: () {
                                  setState(() {
                                    selectedAge--;
                                  });
                                }),
                          ],
                        ),
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
              Navigator.pushNamed(context, 'result_page',
                  arguments: [selectedHeight, selectedWeight, selectedGender]);
            },
          )
        ],
      ),
    );
  }
}
