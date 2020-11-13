import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'assert.dart';
import 'package:quizzler/widget_builder.dart' as WidgetBuilder;

class QuizBrain {
  int _questionNumber = 0;
  List<Assert> _questionsList = [
    Assert(question: 'Some cats are actually allergic to humans', answer: true),
    Assert(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Assert(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Assert(question: 'A slug\'s blood is green.', answer: true),
    Assert(
        question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        answer: true),
    Assert(
        question: 'It is illegal to pee in the Ocean in Portugal.',
        answer: true),
    Assert(
        question:
            'No piece of square dry paper can be folded in half more than 7 times.',
        answer: false),
    Assert(
        question:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answer: true),
    Assert(
        question:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        answer: false),
    Assert(
        question:
            'The total surface area of two human lungs is approximately 70 square metres.',
        answer: true),
    Assert(question: 'Google was originally called \"Backrub\".', answer: true),
    Assert(
        question:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        answer: true),
    Assert(
        question:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        answer: true),
  ];

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
}
