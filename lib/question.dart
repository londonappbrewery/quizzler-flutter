class Question {
  String _question;
  bool _answer;

  Question(String q, bool a) {
    _question = q;
    _answer = a;
  }

  String getQuestion() {
    return _question;
  }

  bool getAnswer() {
    return _answer;
  }
}
