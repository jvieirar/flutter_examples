import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // properties
  var _questions = const [
    {
      'questionText': 'What\'s your favorite colour?',
      'answers': [
        {'text': 'Red', 'score': 1},
        {'text': 'Blue', 'score': 5},
        {'text': 'Green', 'score': 10},
        {'text': 'Pink', 'score': 15}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 1},
        {'text': 'Dog', 'score': 5},
        {'text': 'Horse', 'score': 10},
        {'text': 'Lion', 'score': 15}
      ]
    },
    {
      'questionText': 'What\'s your favorite music?',
      'answers': [
        {'text': 'Metal', 'score': 1},
        {'text': 'Classical', 'score': 5},
        {'text': 'Rock', 'score': 10},
        {'text': 'Jazz', 'score': 15}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  // methods
  void _answerQuestion(int score) {
    setState(() {
      // if (_questionIndex < _questions.length - 1) {
      _questionIndex++;
      _totalScore += score;
      // } else {
      // _questionIndex = 0;
      // }
    });
  }

  void _reset() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // render
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(totalScore: _totalScore, reset: _reset),
      ),
    );
  }
}
