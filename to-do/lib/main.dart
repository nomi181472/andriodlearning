import 'package:flutter/material.dart';
import 'package:to_do/task_screen.dart';
import 'package:provider/provider.dart';

import 'DataProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => Data(),
        child: MaterialApp(home: TaskScreen()));
  }
}
