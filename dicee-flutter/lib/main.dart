import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  int leftNumber = Random().nextInt(1000) % 6 + 1;
  int rightNumber = Random().nextInt(1000) % 6 + 1;
  void ChangeDice() {
    setState(() {
      rightNumber = Random().nextInt(1000) % 6 + 1;
      leftNumber = Random().nextInt(1000) % 6 + 1;
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              child: TextButton(
                  onPressed: () {
                    ChangeDice();
                  },
                  child: Image.asset("images/dice$leftNumber.png"))),
          Expanded(
              child: TextButton(
                  onPressed: () {
                    ChangeDice();
                  },
                  child: Image.asset("images/dice$rightNumber.png")))
        ],
      ),
    );
  }
}
