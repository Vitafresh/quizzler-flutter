import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

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
  QuizBrain quizBrain = QuizBrain();

  void checkUserAnswer(bool userAnswer) {
    int maxQuestions=quizBrain.questionBank.length;

    if (quizEnd) {
      return;
    }

    setState(() {

      if (userAnswer==quizBrain.questionBank[questionIndex].questionAnswer) {
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
                quizBrain.questionBank[questionIndex].questionText,
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
