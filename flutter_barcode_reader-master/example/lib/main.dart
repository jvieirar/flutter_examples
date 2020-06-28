import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcelpoint Scanner App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Parcelpoint Scanner App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // properties
  String _barcode = '';

  // methods
  Future scanBarcode() async {
    try {
      ScanResult barcode = await BarcodeScanner.scan();
      if (mounted) {
        setState(() {
          _barcode = barcode.rawContent;
        });
        await _showMyDialog(barcode.rawContent);
        scanBarcode();
      }
    } catch (e) {
      setState(() {
        _barcode = e.toString();
      });
    }
  }

  Future<void> _showMyDialog(String result) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(result),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // render
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(245, 124, 40, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Barcode:',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              _barcode,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scanBarcode,
        tooltip: 'Scan',
        child: Icon(Icons.camera),
        backgroundColor: Color.fromRGBO(245, 124, 40, 1),
      ),
    );
  }
}

// qr_code_scanner-black-18dp.svg
