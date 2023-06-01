import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Components/my_custom_widget.dart';
import 'package:flutter_application_5/Screens/cubit/input_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../Components/my_custom_widgets.dart';
import '../Components/icon_content.dart';
import '../Components/my_constants.dart';
import '../Components/my_round_icon_button.dart';
import 'result_page.dart';
import '../Components/my_bottom_bar.dart';
import 'package:flutter_application_5/Components/bmi_calculator.dart';

enum Gender { male, female }

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff111111),
          title: Center(
            child: Text(
              'BMI Calculator',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: BlocBuilder<InputCubit, InputState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          child: ReuseableWidget(
                            customColor: state.genderType1 == Gender.male
                                ? state.kActiveColor1
                                : state.kInactiveColor1,
                            customchild:
                                IconContent(FontAwesomeIcons.mars, 'Male'),
                            onPress: () {
                              context.read<InputCubit>().selGenMale();
                            },
                          ),
                        ),
                        Expanded(
                          child: ReuseableWidget(
                              customColor: state.genderType1 == Gender.female
                                  ? state.kActiveColor1
                                  : state.kInactiveColor1,
                              customchild:
                                  IconContent(FontAwesomeIcons.venus, 'Female'),
                              onPress: () {
                                context.read<InputCubit>().selGenFemale();
                              }),
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 200,
                width: 20,
                child: BlocBuilder<InputCubit, InputState>(
                  builder: (context, state) {
                    return ReuseableWidget(
                      customColor: state.kActiveColor1,
                      customchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Height',
                            style: kMyTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(state.height1.toStringAsFixed(0),
                                  style: kMyBoldTextStyle),
                              Text('cm', style: kMyTextStyle)
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Color(0xffff0066),
                                inactiveTrackColor: Color(0xFF8D8E98),
                                thumbColor: Color(0xffff3399),
                                overlayColor: Color(0x299A32CD),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 30)),
                            child: Slider(
                              value: state.height1,
                              min: 60.0,
                              max: 240.0,
                              onChanged:
                                  context.read<InputCubit>().selectHeight,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<InputCubit, InputState>(
                        builder: (context, state) {
                          return ReuseableWidget(
                              customColor: state.kActiveColor1,
                              customchild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Weight',
                                    style: kMyTextStyle,
                                  ),
                                  Text(
                                    state.weight1.toString(),
                                    style: kMyBoldTextStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MyRoundIconButton(FontAwesomeIcons.minus,
                                          () {
                                        context
                                            .read<InputCubit>()
                                            .minusWeight();
                                      }),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      MyRoundIconButton(FontAwesomeIcons.plus,
                                          () {
                                        context.read<InputCubit>().plusWeight();
                                      })
                                    ],
                                  )
                                ],
                              ),
                              onPress: () {});
                        },
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<InputCubit, InputState>(
                        builder: (context, state) {
                          return ReuseableWidget(
                              customColor: state.kActiveColor1,
                              customchild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Age',
                                    style: kMyTextStyle,
                                  ),
                                  Text(
                                    state.age1.toString(),
                                    style: kMyBoldTextStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MyRoundIconButton(FontAwesomeIcons.minus,
                                          () {
                                        context
                                            .read<InputCubit>()
                                            .minusSelectAge();
                                      }),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      MyRoundIconButton(FontAwesomeIcons.plus,
                                          () {
                                        context
                                            .read<InputCubit>()
                                            .plusSelectAge();
                                      })
                                    ],
                                  )
                                ],
                              ),
                              onPress: () {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6, bottom: 5),
                child: BlocBuilder<InputCubit, InputState>(
                  builder: (context, state) {
                    return MyBottomBar(
                      barText: 'Calculate',
                      onPressed: () {
                        BMICalculatorBrain calculator = BMICalculatorBrain();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => (BlocProvider.value(
                              value: InputCubit(),
                              child: ResultPage(
                                  // result: calculator.getResult(),
                                  // resultText: calculator.bmiResultText(),
                                  // advice: calculator.advice(),
                                  ),
                            )),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
