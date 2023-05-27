// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/Screens/cubit/input_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => InputCubit(),
        child: InputPage(),
      ),
    );
  }
}
