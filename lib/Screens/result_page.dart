import 'package:flutter/material.dart';
import 'package:flutter_application_5/Screens/cubit/input_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Components/my_custom_widget.dart';
import '../Components/my_custom_widgets.dart';
import '../Components/my_constants.dart';
import '../Components/my_bottom_bar.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.resultText, required this.result, required this.advice});
  final String resultText;
  final String result;
  final String advice;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text(
            'BMI Calculator',
          ),
        ),
        body: BlocBuilder<InputCubit, InputState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Your Result',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReuseableWidget(
                      customColor: state.kActiveColor1,
                      customchild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            resultText.toString().toUpperCase(),
                            style: kMyResultTextStyle,
                          ),
                          Text(
                            result,
                            style: kMyBmiTextStyle,
                          ),
                          Text(
                            advice,
                            style: kMyBodyTextStyle,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: MyBottomBar(
                    barText: 'Re-Calculate',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
