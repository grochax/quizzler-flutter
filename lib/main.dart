import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> scoreKeeper = [];

  List<Question> questionList = [
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs.',
        questionAnswer: false),
    Question(
        questionText:
            'Approximately one quarter of human bones are in the feet.',
        questionAnswer: true),
    Question(
      questionText: 'A slug\'s blood is green.',
      questionAnswer: true,
    ),
  ];

  var questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    questionList[questionNumber].questionText,
                    //questions[questionNumber],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: () {
                      setState(
                        () {
                          if (questionList[questionNumber].questionAnswer ==
                              true) {
                            print(questionList[questionNumber].questionAnswer);

                            scoreKeeper.add(
                              Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            );
                          } else {
                            scoreKeeper.add(
                              Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            );
                          }
                          questionNumber++;
                        },
                      );
                    },
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: () {
                      setState(
                        () {
                          if (questionList[questionNumber].questionAnswer ==
                              false) {
                            scoreKeeper.add(
                              Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            );
                          } else {
                            scoreKeeper.add(
                              Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            );
                          }

                          questionNumber++;
                        },
                      );
                    },
                    child: Text(
                      'False',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    color: Colors.red,
                  ),
                ),
              ),
              Row(children: scoreKeeper)
            ],
          ),
        ),
      ),
    );
  }
}
/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
