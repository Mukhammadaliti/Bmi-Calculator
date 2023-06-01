import 'dart:math';

class BMICalculatorBrain {
  // static double bmiCalculator({ this.weight,  this.height});

  // double? height;
  // int? weight;
  // double bmi = 0.0;

  static double getResult({double? height, int? weight}) {
    final bmi = weight! / pow(height! / 100, 2);
    return bmi;
  }

  static String bmiResultText(double bmi) {
    if (bmi > 30) {
      return 'Obese';
    } else if (bmi > 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  static String advice(bmi) {
    if (bmi > 30) {
      return 'Eat Balanced Diet and Exercise Daily';
    } else if (bmi >= 25) {
      return 'Eat healthy meals and Exercise more than 4 times a week';
    } else if (bmi >= 19) {
      return 'Excellent your BMI is looking Good';
    } else {
      return 'Eat 3-5 meals per day including lots of Proteins';
    }
  }
}
