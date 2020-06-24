import 'package:flutter/material.dart';

import './my_text.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // properties
  final _texts = const [
    'This is the first sentence',
    'And this is the second one'
  ];
  int _textIndex = 0;

  // methods
  void swapTexts() {
    setState(() {
      if (_textIndex == 0) {
        _textIndex = 1;
      } else {
        _textIndex = 0;
      }
    });
  }

  // render
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Assignment 1',
            ),
          ),
          body: Center(
            child: MyText(_texts[_textIndex]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: swapTexts,
            tooltip: 'Increment',
            child: Icon(Icons.edit),
          )),
    );
  }
}
