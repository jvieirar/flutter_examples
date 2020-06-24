import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  // properties
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  // constructors
  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  // methods

  // render
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          this.questions[questionIndex]['questionText'],
        ),
        ...(this.questions[questionIndex]['answers']
                as List<Map<String, Object>>)
            .map(
          (answer) =>
              Answer(answer['text'], () => answerQuestion(answer['score'])),
        ),
      ],
    );
  }
}
