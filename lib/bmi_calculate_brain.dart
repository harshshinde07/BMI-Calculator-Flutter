import 'dart:math';

class BMIBrain {
  final int height;
  final int weight;
  double _bmi;

  BMIBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 40) {
      return 'Obese Class III';
    } else if (_bmi >= 35) {
      return 'Obese Class II';
    } else if (_bmi >= 30) {
      return 'Obese Class I';
    } else if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else if (_bmi >= 16) {
      return 'Underweight';
    } else if (_bmi >= 15) {
      return 'Severely Underweight';
    } else {
      return 'Very Severely Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 40) {
      return 'You are very severely obese. please consult a doctor.';
    } else if (_bmi >= 35) {
      return 'You are severely obese. please consult a doctor.';
    } else if (_bmi >= 30) {
      return 'You are moderately obese. Please consult a fitness trainer.';
    } else if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else if (_bmi >= 16) {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    } else if (_bmi >= 15) {
      return 'You have pretty low body weight. Try to eat a lot more.';
    } else {
      return 'You have a very low body weight. Please consult a nutritionist.';
    }
  }
}
