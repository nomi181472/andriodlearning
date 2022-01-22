import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_app/screens/chat_screen.dart';

import './../Components/rounded_buttons.dart';
import './../constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String Id = "/LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showSpinner = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kInputTextFieldDecoration.copyWith(
                    hintText: "Enter your email"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kInputTextFieldDecoration.copyWith(
                    hintText: "Enter your password."),
              ),
              SizedBox(
                height: 24.0,
              ),
              WelcomeScreenButton(
                colors: Colors.lightBlueAccent,
                onPress: () async {
                  try {
                    setState(() {
                      showSpinner = true;
                    });
                    final currentUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (currentUser != null) {
                      setState(() {
                        showSpinner = true;
                      });
                      Navigator.pushNamed(context, ChatScreen.Id);
                    }
                    setState(() {
                      showSpinner = true;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                text: "Log in",
              )
            ],
          ),
        ),
      ),
    );
  }
}
