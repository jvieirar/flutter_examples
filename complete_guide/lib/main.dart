import 'package:flutter/material.dart';

import './question.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // properties
  var _questions = [
    'What\'s your favorite colour?',
    'What\'s your favorite animal?'
  ];
  var _questionIndex = 0;

  // methods
  void answerQuestion() {
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
              _questions[_questionIndex],
            ),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion,
              // example for annonymous functions
              // onPressed: () => print('Answer 1'),
              // onPressed: () {
              //   // ...
              //   print('Answer 1');
              // },
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
