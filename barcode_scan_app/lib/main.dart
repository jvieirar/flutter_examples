import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      BarcodeScanner.
      if (mounted) {
        setState(() {
          _barcode = barcode.rawContent;
        });
      }
    } catch (e) {
      setState(() {
        _barcode = e.toString();
      });
    }
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
        child: SvgPicture.string(
          '''<svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="black" width="18px" height="18px">
  <rect fill="none" height="24" width="24" />
  <path d="M9.5,6.5v3h-3v-3H9.5 M11,5H5v6h6V5L11,5z M9.5,14.5v3h-3v-3H9.5 M11,13H5v6h6V13L11,13z M17.5,6.5v3h-3v-3H17.5 M19,5h-6v6 h6V5L19,5z M13,13h1.5v1.5H13V13z M14.5,14.5H16V16h-1.5V14.5z M16,13h1.5v1.5H16V13z M13,16h1.5v1.5H13V16z M14.5,17.5H16V19h-1.5 V17.5z M16,16h1.5v1.5H16V16z M17.5,14.5H19V16h-1.5V14.5z M17.5,17.5H19V19h-1.5V17.5z M21,7L21,7c-0.55,0-1-0.45-1-1V4h-2 c-0.55,0-1-0.45-1-1v0c0-0.55,0.45-1,1-1h3c0.55,0,1,0.45,1,1v3C22,6.55,21.55,7,21,7z M22,21v-3c0-0.55-0.45-1-1-1h0 c-0.55,0-1,0.45-1,1v2h-2c-0.55,0-1,0.45-1,1v0c0,0.55,0.45,1,1,1h3C21.55,22,22,21.55,22,21z M3,22h3c0.55,0,1-0.45,1-1v0 c0-0.55-0.45-1-1-1H4v-2c0-0.55-0.45-1-1-1h0c-0.55,0-1,0.45-1,1v3C2,21.55,2.45,22,3,22z M2,3v3c0,0.55,0.45,1,1,1h0 c0.55,0,1-0.45,1-1V4h2c0.55,0,1-0.45,1-1v0c0-0.55-0.45-1-1-1H3C2.45,2,2,2.45,2,3z" />
</svg>''',
        ),
        backgroundColor: Color.fromRGBO(245, 124, 40, 1),
      ),
    );
  }
}

// qr_code_scanner-black-18dp.svg
