import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

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
  List<Icon> myIcons = [];
  int qno = 0;

  List<Question> questionBank = [
    Question(q: 'Python is used to write Flutter Code', a: false),
    Question(q: 'Flutter is developed by Google', a: true),
    Question(q: 'Some ramdom true question', a: true),
    Question(q: 'You Have completed the quiz', a: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.black45),
                onPressed: () {
                  setState(() {
                    myIcons.clear();
                    qno = 0;
                  });
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  weight: 10.0,
                  size: 30.0,
                ))
          ],
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[qno].questionText,
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
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.teal,
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (qno < questionBank.length - 1) {
                    if (questionBank[qno].questionAnswer == true) {
                      myIcons.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    } else {
                      myIcons.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    }
                    qno++;
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
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (qno < questionBank.length - 1) {
                    if (questionBank[qno].questionAnswer == false) {
                      myIcons.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    } else {
                      myIcons.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    }
                    qno++;
                  }
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: myIcons,
        )
      ],
    );
  }
}
