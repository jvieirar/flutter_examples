import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // properties
  final String questionText;

  // constructor
  Question(this.questionText);

  // render
  @override
  Widget build(BuildContext context) {
    return Text(this.questionText);
  }
}
