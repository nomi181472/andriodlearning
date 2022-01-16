import 'package:bmi_calculator/calculatorBrain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'containers.dart';
import "Constants.dart";
import 'results_page.dart';
import 'Bottom_navigator_gesture_detector.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
/*  Color maleCardColor = inActiveColor;
  Color femaleCardColor = activeColor;
  void updateColor(GenderType selectedGender) {
    if (selectedGender == GenderType.male) {
      if (maleCardColor == inActiveColor) {
        maleCardColor = activeColor;
        femaleCardColor = inActiveColor;
      } else {
        maleCardColor = inActiveColor;
      }
    }
    if (selectedGender == GenderType.female) {
      if (femaleCardColor == inActiveColor) {
        femaleCardColor = activeColor;
        maleCardColor = inActiveColor;
      } else {
        femaleCardColor = inActiveColor;
      }
    }
  }*/
  int height = 180;
  int weight = 80;
  int age = 20;
  GenderType selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Containers(
                    onTap: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    color: selectedGender == GenderType.male
                        ? kActiveColor
                        : kInActiveColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      containerText: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: Containers(
                    onTap: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    color: selectedGender == GenderType.female
                        ? kActiveColor
                        : kInActiveColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      containerText: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Containers(
              color: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text(
                        "cm",
                        style: kNumberTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTickMarkColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                      value: height.toDouble(),
                      max: 220,
                      min: 120,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Containers(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight", style: kTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              function: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              function: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    color: kActiveColor,
                  ),
                ),
                Expanded(
                  child: Containers(
                    color: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: kTextStyle,
                        ),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              function: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              function: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationGestureDetector(
            title: "Calculate",
            onTap: () {
              BMICalculator bmiCal =
                  new BMICalculator(height: height, weight: weight);
              print(bmiCal.calculateBMI());
              print("result:");

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    interpretation: bmiCal.getSuggestions(),
                    bmi: bmiCal.calculateBMI(),
                    result: bmiCal.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconData, @required this.function});
  final IconData iconData;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        iconData,
      ),
      shape: CircleBorder(),
      elevation: 6.0,
      onPressed: function,
      fillColor: Color(0xFF4c4f5e),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
    );
  }
}
