import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain quizBrain =new QuizBrain();
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
  List<Icon> scorekeeper =[
  ];
  void checkAnswer(bool usersPick){
    bool correctAnswer=quizBrain.getAnswer();
    setState(() {
      if(quizBrain.isFinished()==true){
        Alert(
          context: context,
          title:'The End!',
desc: 'Well done.You have reach the end.'
        ).show();
        quizBrain.reset();
        scorekeeper=[];
      }else {
        if (usersPick == correctAnswer) {
          scorekeeper.add(Icon(Icons.check, color: Colors.green,));
        } else {
          scorekeeper.add(Icon(Icons.close, color: Colors.red,));
        }

        quizBrain.nextQuestion();
      }
    });

  }
 // List<String> questionkeeper =[
 //  'Beyza\'s favorite color is green.',
 //  'Beyza\'s favorite tv series is The Walking Dead',
 //  'Beyza is not fearless.',
 //];
 //  List<bool> checkanswer=[false, true, true,];
 // Question q1 =Question(q:    'Beyza\'s favorite color is green.',a: false);



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
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
                },

            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
  checkAnswer(false);
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children:scorekeeper,
        )
      ],
    );
  }
}






