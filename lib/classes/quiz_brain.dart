import 'assert.dart';

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

  nextQuestion() {
    if (_questionNumber < (_questionsList.length - 1)) _questionNumber++;
  }

  getAnswer() => _questionsList[_questionNumber].answer;

  answerChecker(bool userAnswer, bool correctAnswer) {
    // if()
  }
}
