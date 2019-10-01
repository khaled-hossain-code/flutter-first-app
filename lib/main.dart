import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  var app = MyApp();
  runApp(app);
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'question': 'what\'s your favourite colors?',
        'answers': ['Answer1.1', 'Answer1.2', 'Answer1.3']
      },
      {
        'question': 'what\'s your favourite animals?',
        'answers': ['Answer2.1', 'Answer2.2', 'Answer2.3']
      }
    ];

    void _answerQuestion(answer) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
      print(answer);
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < questions.length ? Column(
            children: [
              Question(questions[_questionIndex]['question']),
              ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList(),
            ],
          ) : Center(child: Text('You Did it'),)),
    );
  }
}
