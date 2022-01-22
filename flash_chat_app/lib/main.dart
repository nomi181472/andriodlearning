import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/welcome_screen.dart';
import './screens/login_screen.dart';
import './screens/registration_screen.dart';
import './screens/chat_screen.dart';
import './DefaultFirebaseConfig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.Id,
      routes: {
        WelcomeScreen.Id: (context) => WelcomeScreen(),
        LoginScreen.Id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.Id: (context) => ChatScreen()
      },
    );
  }
}
