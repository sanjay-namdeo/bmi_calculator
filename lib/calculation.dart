import 'dart:math';

class BMICalculator {
  int weight = 60;
  int height = 183;

  double _bmi;

  String getRecalculate() {
    _bmi = (weight / pow((height / 100), 2));
    return _bmi.toStringAsFixed(1);
  }

  String getCategory() {
    if (_bmi <= 18.5) return "Underweight";
    if (_bmi > 18.5 && _bmi <= 23)
      return "Normal Range";
    else if (_bmi > 23 && _bmi <= 25)
      return "Overweight—At Risk";
    else if (_bmi > 25 && _bmi <= 30)
      return "Overweight—Moderately Obese";
    else
      return "Overweight—Severely Obese";
  }

  String getHealthRisk() {
    if (_bmi <= 18.5)
      return "Risk of developing problems such as nutritional deficiency and osteoporosis";
    if (_bmi > 18.5 && _bmi <= 23)
      return "You have a normal body weight. Good job!";
    else if (_bmi > 23 && _bmi <= 27.5)
      return "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes";
    else
      return "High risk of developing heart disease, high blood pressure, stroke, diabetes";
  }
}
