import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // properties
  var _questions = [
    {
      'questionText': 'What\'s your favorite colour?',
      'answers': ['Red', 'Blue', 'Green', 'Pink']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Cat', 'Dog', 'Horse', 'Lion']
    }
  ];
  var _questionIndex = 0;

  // methods
  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: Column(
          children: <Widget>[
            Question(
              this._questions[_questionIndex]['questionText'],
            ),
            ...(this._questions[_questionIndex]['answers'] as List<String>)
                .map((answer) => Answer(answer, _answerQuestion)),
          ],
        ),
      ),
    );
  }
}
