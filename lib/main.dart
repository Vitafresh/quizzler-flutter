import 'package:flutter/material.dart';
import 'question.dart';

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
  int questionIndex = 0; //Current question number
  bool quizEnd = false;

  List<Icon> listScore = [];
  List<Question> questionBank=[
    Question(questionText: 'Париж это столица Франции?', questionAnswer: true),
    Question(questionText: 'Херсон - это столица Украины?', questionAnswer: false),
    Question(questionText: 'Кишенев - столица Румынии?', questionAnswer: false),
  ];

  // List<String> listQuestions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  //
  // List<bool> listAnswers = [
  //   false,
  //   true,
  //   true,
  // ];

  void checkUserAnswer(bool userAnswer) {
    int maxQuestions=questionBank.length;

    if (quizEnd) {
      return;
    }

    setState(() {

      if (userAnswer==questionBank[questionIndex].questionAnswer) {
        listScore.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      }
      else{
        listScore.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      if (questionIndex < maxQuestions-1) {
        questionIndex++;
        // print('questionIndex = $questionIndex, maxQuestions=$maxQuestions');
      }
      else {
        quizEnd=true;
      }

    }); //SetState
  }

  // Icon(
  //   Icons.check,
  //   color: Colors.green,
  // ),
  // Icon(
  //   Icons.close,
  //   color: Colors.red,
  // )

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
                questionBank[questionIndex].questionText,
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
                'Правда',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkUserAnswer(true);

              }, //OnPressed
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'Ложь',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkUserAnswer(false);
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: listScore,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
