import 'package:flutter/cupertino.dart';
import 'dart:math';

class BMICalculator {
  BMICalculator({@required this.height, @required this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return "OverWeight";
    } else if (_bmi > 18) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getSuggestions() {
    if (_bmi > 25) {
      return "OverWeight!!! Please less eat food";
    } else if (_bmi > 18) {
      return "Normal!!! enjoy...";
    } else {
      return "UnderWeight!!! Please eat more";
    }
  }
}
