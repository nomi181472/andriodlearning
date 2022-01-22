import 'package:flutter/material.dart';

class WelcomeScreenButton extends StatelessWidget {
  WelcomeScreenButton(
      {required this.colors, required this.text, required this.onPress});
  final Color colors;
  final String text;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colors,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () => onPress(),
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
