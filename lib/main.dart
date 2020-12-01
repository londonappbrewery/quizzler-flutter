import 'package:flutter/material.dart';
import 'classes/quiz_brain.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:quizzler/spanish_questions.dart';
import 'package:quizzler/english_questions.dart';

SpanishQuestions spanishQuestions = SpanishQuestions();
EnglishQuestions englishQuestions = EnglishQuestions();
int initialIndex = 0;

QuizBrain quizBrain = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        toggleBuilder(),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
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
                  if (quizBrain.gameListener(context, reset)) {
                    scoreKeeper.add(quizBrain.answerChecker(true));
                    quizBrain.nextQuestion();
                  }
                });
                //The user picked true.
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
                //The user picked false.
                setState(() {
                  if (quizBrain.gameListener(context, reset)) {
                    scoreKeeper.add(quizBrain.answerChecker(false));
                    quizBrain.nextQuestion();
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }

  reset() {
    quizBrain.setQuestionNumber(0);
    scoreKeeper = [];
  }

  toggleBuilder() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 15.0),
        child: ToggleSwitch(
          minWidth: 90.0,
          cornerRadius: 10.0,
          activeBgColor: Colors.white,
          activeFgColor: Colors.blue,
          inactiveBgColor: Colors.blue.shade900,
          inactiveFgColor: Colors.grey,
          initialLabelIndex: initialIndex,
          labels: ['Español', 'English'],
          onToggle: (int i) {
            print('switched to $i');
            setState(() {
              initialIndex = i;
              (i == 1)
                  ? quizBrain.setList(englishQuestions.getEnglishQuestions())
                  : quizBrain.setList(spanishQuestions.getSpanishQuestions());
            });
          },
        ),
      ),
    );
  }
}
