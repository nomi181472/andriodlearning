import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './../Components/rounded_buttons.dart';
import './../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './chat_screen.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "/RegistrationScreen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = "";
  String password = "";
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
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
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kInputTextFieldDecoration.copyWith(
                    hintText: "Enter your password"),
              ),
              const SizedBox(
                height: 24.0,
              ),
              WelcomeScreenButton(
                colors: Colors.blueAccent,
                onPress: () async {
                  try {
                    setState(() {
                      showSpinner = true;
                    });
                    final userCreated =
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                    print("--");
                    print(userCreated.user);
                    if (userCreated != null) {
                      setState(() {
                        showSpinner = true;
                      });
                      Navigator.pushNamed(context, ChatScreen.Id);
                    }
                  } catch (e) {
                    print("exception");
                    print(e);
                  }
                },
                text: 'Register',
              )
            ],
          ),
        ),
      ),
    );
  }
}
