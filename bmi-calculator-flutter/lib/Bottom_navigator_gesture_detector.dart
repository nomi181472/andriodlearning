import 'package:flutter/material.dart';
import "Constants.dart";
import 'results_page.dart';

class BottomNavigationGestureDetector extends StatelessWidget {
  BottomNavigationGestureDetector({@required this.title, @required this.onTap});
  final Function onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kLargeTextStyle,
          ),
        ),
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 10),
        color: kBottomContainerColor,
      ),
    );
  }
}
