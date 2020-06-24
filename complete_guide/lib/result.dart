import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // properties
  final int totalScore;
  final Function reset;

  // constructors
  Result({this.totalScore, this.reset});

  // methods
  String get _resultPhrase {
    String text;

    if (totalScore < 15) {
      text = 'You are awesome';
    } else if (totalScore < 30) {
      text = 'You are still nice';
    } else {
      text = 'Please go home';
    }

    return text + '\nScore: $totalScore';
  }

  // render
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            _resultPhrase,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text('Reset'),
            onPressed: reset,
          )
        ],
      ),
    );
  }
}
