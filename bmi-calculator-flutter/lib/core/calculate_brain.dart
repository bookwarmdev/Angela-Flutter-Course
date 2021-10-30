import 'dart:math';

class CalculateBrain {
  CalculateBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;


  String calculateBrain() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweigth';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a heigher than normal body weight. Try to exerise more.';
    } else if (_bmi > 18.5) {
      return 'You have normal body weight. Good Job!';
    } else {
      return 'You have lower than normal body weight. You can eat a bit more.';
    }
  }
}
