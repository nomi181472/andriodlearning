import 'package:bmi_calculator/containers.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';
import 'Bottom_navigator_gesture_detector.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmi,
      @required this.result,
      @required this.interpretation});
  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI calculator"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            )),
            Expanded(
              flex: 5,
              child: Containers(
                color: kActiveColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(this.result, style: kResultTextStyle),
                    Text(
                      this.bmi,
                      style: kBMIResultTextStyle,
                    ),
                    Text(
                      this.interpretation,
                      style: kBMISuggestionResultTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomNavigationGestureDetector(
              title: "Re-Calculate",
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
