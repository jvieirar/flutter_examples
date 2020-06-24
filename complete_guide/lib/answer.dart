import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // properties
  final String _answerText;
  final Function _handleClick;

  // constructors
  Answer(this._answerText, this._handleClick);

  // methods
  void handleOnPressed() {
    print('Answer ${this._answerText} pressed');
    this._handleClick();
  }

  // render
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(this._answerText),
        onPressed: handleOnPressed,
      ),
    );
  }
}
