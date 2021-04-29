import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  List<Icon> listScore = [];  //Icons: red cross or green check mark (wrong or correct answer
  QuizBrain quizBrain = QuizBrain();

  void checkUserAnswer(bool userAnswer) {
    setState(() {

    if (quizBrain.isQuizFinished()) {
      //All questions were displayed

      //Alert(context: context, title: "EndOfQuiz", desc: "You've answered all questions!").show();

      Alert(
        context: context,
        type: AlertType.success,
        title: "End of quiz",
        desc: "You've answered all questions! Score = " + quizBrain.getScore().toString(),
        buttons: [
          DialogButton(
            child: Text(
              "Круто!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

      quizBrain.resetQuiz();
      listScore.clear();
      return;
    }


      if (userAnswer == quizBrain.getCorrectAnswer()) {
        //Correct answer
        listScore.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        quizBrain.addScore();
      } else {
        //Wrong answer
        listScore.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizBrain.gotoNextQuestion();
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
                quizBrain.getQuestionIndex().toString() +
                    "\n" +
                    quizBrain.getQuestionText(),
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
