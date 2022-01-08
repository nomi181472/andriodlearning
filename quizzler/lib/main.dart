import 'package:flutter/material.dart';
import 'package:quizzler/QUIZBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  QuizBrain quizBrain = QuizBrain();
  List<Widget> scoreIcons = [];
  void addScoreIcons(correctAnswer, userAnswer) {
    if (!quizBrain.isMaxReached()) {
      if (correctAnswer == userAnswer) {
        scoreIcons.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreIcons.add(Icon(
          Icons.cancel,
          color: Colors.red,
        ));
      }
    } else {
      Alert(context: context, title: "Completed", desc: "Quiz Completed")
          .show();
      setState(() {
        quizBrain.reset();
        scoreIcons = [];
      });
    }
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  this.addScoreIcons(
                      this.quizBrain.getAnswerOfQuestion(), true);
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  this.addScoreIcons(
                      this.quizBrain.getAnswerOfQuestion(), false);
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Expanded(
          child: Row(
            children: scoreIcons,
          ),
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
