import 'package:flutter/material.dart';
import 'quiz_logic.dart';

QuizLogic quizLogic = QuizLogic();

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
  int currentQuestion = 0;
  List<Icon> scores = [];

  void selectedTrue() {
    if (quizLogic.questions[currentQuestion].answer) {
      // selected true and answer was true
      setState(() {
        scores.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      });
    } else {
      // selected true but answer was false
      setState(() {
        scores.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      });
    }

    if (currentQuestion < quizLogic.questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      //TODO: game is over
    }
  }

  void selectedFalse() {
    if (quizLogic.questions[currentQuestion].answer) {
      // selected false but answer was true
      setState(() {
        scores.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      });
    } else {
      // selected false and answer was false
      setState(() {
        scores.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      });
    }

    if (currentQuestion < quizLogic.questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      //TODO: game is over
    }
  }

  @override
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
                quizLogic.questions[currentQuestion].question,
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
                // The user picked true.
                selectedTrue();
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
                // The user picked false.
                selectedFalse();
              },
            ),
          ),
        ),
        Row(
          children: scores,
        ),
      ],
    );
  }
}
