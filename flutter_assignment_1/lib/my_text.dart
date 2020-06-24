import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  // properties
  final String text;

  // constructors
  MyText(this.text);

  // methods

  // render
  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
