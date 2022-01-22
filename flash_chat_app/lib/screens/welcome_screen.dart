import './login_screen.dart';
import './registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import './../Components/rounded_buttons.dart';
import './../constants.dart';

class WelcomeScreen extends StatefulWidget {
  static String Id = "/WelcomeScreen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: "logo",
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60,
                    ),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Group Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            WelcomeScreenButton(
              colors: Colors.lightBlueAccent,
              text: 'Log In',
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.Id);
              },
            ),
            WelcomeScreenButton(
              colors: Colors.blueAccent,
              text: 'Register',
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
