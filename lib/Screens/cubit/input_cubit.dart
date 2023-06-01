import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/Screens/input_page.dart';

part 'input_state.dart';

class InputCubit extends Cubit<InputState> {
  InputCubit() : super(InputState());

  void selectHeight(double newValue) {
    emit(
      state.copyWith(height: state.height1 = newValue),
    );
  }

  void selGenFemale() {
    emit(state.copyWith(genderType: state.genderType1 = Gender.female));
  }

  void selGenMale() {
    emit(state.copyWith(genderType: state.genderType1 = Gender.male));
  }

  void plusWeight() {
    emit(
      state.copyWith(weight: state.weight1 + 1),
    );
  }

  void minusWeight() {
    emit(state.copyWith(weight: state.weight1 - 1));
  }

  void plusSelectAge() {
    emit(state.copyWith(age: state.age1 + 1));
  }

  void minusSelectAge() {
    emit(state.copyWith(age: state.age1 - 1));
  }
}
