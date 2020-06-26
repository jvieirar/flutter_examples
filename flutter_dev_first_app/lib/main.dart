import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // properties
  var _wordPair = WordPair.random();

  // constructors

  // methods

  // render
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Main App Text'),
        ),
        body: Center(
          child: Text(_wordPair.asPascalCase),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => setState(
            () => _wordPair = WordPair.random(),
          ),
        ),
      ),
    );
  }
}
