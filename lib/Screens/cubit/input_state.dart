part of 'input_cubit.dart';

class InputState {
  InputState({
    this.height1 = 180,
    this.weight1 = 40,
    this.age1 = 20,
    this.genderType1,
    this.kActiveColor1 = Colors.blue,
    this.kInactiveColor1 = Colors.black12,
  });
  double height1;
  int weight1;
  int age1;
  Gender? genderType1;
  Color kActiveColor1;
  Color kInactiveColor1;
  InputState copyWith({
    double? height,
    int? weight,
    int? age,
    Gender? genderType,
    Color? kActiveColor,
    Color? kInactiveColor,
  }) {
    return InputState(
      height1: height ?? height1,
      weight1: weight ?? weight1,
      age1: age ?? age1,
      genderType1: genderType ?? genderType1,
      kActiveColor1: kActiveColor ?? kActiveColor1,
      kInactiveColor1: kInactiveColor ?? kInactiveColor1,
    );
  }
}
