import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.teal,
            /*
            appBar: AppBar(
              title: Text("title"),
              backgroundColor: Colors.teal,
            ),*/
            body: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage("images/2.jpg"),
                ),
                Text(
                  "Noman Ali",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Pushster',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "FLUTTER DEVELOPER",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SourceSansPro',
                      color: Colors.teal.shade100,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(color: Colors.teal.shade900),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 25,
                      color: Colors.teal.shade900,
                    ),
                    title: Text(
                      "9203042531047",
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.teal.shade900,
                    ),
                    title: Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ))));
  }
}
