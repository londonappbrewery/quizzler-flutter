class Question {
  // In dart, adding the '_' before the name of the variable makes it private
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
