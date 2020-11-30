import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quizzler/english_questions.dart';
import 'package:quizzler/widget_builder.dart' as WidgetBuilder;
import 'package:quizzler/spanish_questions.dart';

SpanishQuestions spanishQuestions = SpanishQuestions();
EnglishQuestions englishQuestions = EnglishQuestions();

class QuizBrain {
  int _questionNumber = 0;
  int _correctAnswers = 0;
  List _questionsList = englishQuestions.getEnglishQuestions();

  getQuestion() => _questionsList[_questionNumber].question;

  getListLength() => _questionsList.length;
  getQuestionNumber() => _questionNumber;
  setQuestionNumber(number) => _questionNumber = number;

  nextQuestion() {
    if (_questionNumber < (_questionsList.length - 1)) _questionNumber++;
  }

  getAnswer() => _questionsList[_questionNumber].answer;

  Icon answerChecker(bool userAnswer) {
    Icon response;
    print("userAnswer: $userAnswer correctAnswer: ${(getAnswer())}");
    (userAnswer == getAnswer())
        ? response = WidgetBuilder.iconsBuilder(Icons.check, Colors.green)
        : response = WidgetBuilder.iconsBuilder(Icons.close, Colors.red);
    return response;
  }

  bool gameListener(BuildContext context, resetCallBack) {
    bool result = true;
    if (_questionNumber == (getListLength() - 1)) {
      Alert(context: context, title: "It's over brah").show();
      resetCallBack();
      result = false;
    }
    return result;
  }

  setList(list) => _questionsList = list;
}
