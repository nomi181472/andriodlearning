import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.blueGrey,
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.blueGrey[900],
      title: const Text("Hello World"),
    ),
    body: Center(
      child: Image(
        image: AssetImage('images/diamond.png'),
      ),
    ),
  )));
}
