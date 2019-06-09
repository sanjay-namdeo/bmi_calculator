import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'navigation_button.dart';
import 'constants.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    print(args);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: new Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                child: Text(
                  'Your result',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: kActiveColor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: Text(
                        'NORMAL',
                        style: TextStyle(
                            color: Colors.green.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '22.1',
                        style: kResultTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        'Nomral BMI range:',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        '18.5 - 25 kg/m2',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, top: 50.0, right: 40.0),
                      child: Text('You have a normal body weight. Good job!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      color: Color(0xFF090C22),
                      width: 250,
                      child: FlatButton(
                        onPressed: null,
                        child: Text(
                          'SAVE RESULT',
                          style:
                              TextStyle(fontSize: 17.0, color: Colors.white70),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            NavigatorButton(
              buttonName: 'RE-CALCULATE YOUR BMI',
              navigateTo: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
