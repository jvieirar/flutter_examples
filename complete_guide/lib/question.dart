import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // properties
  final String questionText;

  // constructor
  Question(this.questionText);

  // render
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        this.questionText,
        style: TextStyle(
          fontSize: 24,
        ),
        textAlign: TextAlign
            .center, // by default Text width is same as text it contains, "display: inline"
      ),
    );
  }
}
