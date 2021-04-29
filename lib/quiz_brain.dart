import 'question.dart';

class QuizBrain {
  int _questionIndex = 0;
  bool _quizEnd = false;
  int _score=0;

  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
    // Question('Париж это столица Франции?', true),
    // Question('Херсон - это столица Украины?', false),
    // Question('Кишенев - столица Румынии?', false),
  ];



  String getQuestionText() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }

  int getNumberOfQuestions() {
    return _questionBank.length;
  }

  int getQuestionIndex() {
    return _questionIndex;
  }

  void gotoNextQuestion() {
    if (_questionIndex < _questionBank.length - 1) {
      //Go to the next question index
      _questionIndex++;
    } else {
      //It was the last question
      _quizEnd = true;
    }
  }

  bool isQuizFinished() {
    return _quizEnd;
  }

  void addScore(){
    _score++;
  }

  int getScore(){
    return _score;
  }

  void resetQuiz(){
    _questionIndex=0;
    _quizEnd=false;
    _score=0;
  }



}
