import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/input_page.dart';
import 'package:bmi_calculator/pages/result_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'input_page',
      routes: {
        'input_page': (context) => InputPage(),
        'result_page': (context) => ResultPage()
      },
      theme: ThemeData.dark(),
    );
  }
}
