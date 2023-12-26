import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BmiProvider extends ChangeNotifier {
  double _heightValue = 1.5;
  double _weightValue = 50.0;
  double _bmi = 0.0;
  String _status = "";
  Color _color = Colors.green;

  double get heightValue => _heightValue;

  double get weightValue => _weightValue;

  double get bmi => _bmi;

  String get status => _status;

  Color get color => _color;

  BmiProvider() {
    _updateBMI();
  }

  changeHeight(double value) {
    _heightValue = value;
    _updateBMI();
    notifyListeners();
  }

  changeWeight(double value) {
    _weightValue = value;
    _updateBMI();
    notifyListeners();
  }

  _updateBMI() {
    _bmi = weightValue / (heightValue * heightValue);
    _updateStatus();
    _updateColor();
  }

  _updateStatus() {
    _status = _getStatus();
  }

  _updateColor() {
    _color = _getColor();
  }

  Color _getColor() {
    if (bmi < 16.0) {
      return Colors.green.shade100;
    }
    if (bmi >= 16.0 && bmi <= 16.9) {
      return Colors.green.shade200;
    }
    if (bmi >= 17.0 && bmi <= 18.4) {
      return Colors.green.shade300;
    }
    if (bmi >= 18.5 && bmi <= 24.9) {
      return Colors.green;
    }
    if (bmi >= 25.0 && bmi <= 29.9) {
      return Colors.red.shade400;
    }
    if (bmi >= 30.0 && bmi <= 34.9) {
      return Colors.red.shade500;
    }
    if (bmi >= 35.0 && bmi <= 39.9) {
      return Colors.red.shade600;
    }
    return Colors.red.shade900;
  }

  String _getStatus() {
    if (bmi < 16.0) {
      return BMI.underweightSevere;
    }
    if (bmi >= 16.0 && bmi <= 16.9) {
      return BMI.underweightModerate;
    }
    if (bmi >= 17.0 && bmi <= 18.4) {
      return BMI.underweightMild;
    }
    if (bmi >= 18.5 && bmi <= 24.9) {
      return BMI.normal;
    }
    if (bmi >= 25.0 && bmi <= 29.9) {
      return BMI.overweight;
    }
    if (bmi >= 30.0 && bmi <= 34.9) {
      return BMI.obese_1;
    }
    if (bmi >= 35.0 && bmi <= 39.9) {
      return BMI.obese_2;
    }
    return BMI.obese_3;
  }
}
