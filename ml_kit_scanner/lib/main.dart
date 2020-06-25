import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScanApp(),
    ));

class ScanApp extends StatefulWidget {
  @override
  _ScanAppState createState() => _ScanAppState();
}

class _ScanAppState extends State<ScanApp> {
  // properties
  File _image;
  final picker = ImagePicker();

  // constructors

  // methods
  Future pickImage() async {
    // load image
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (mounted) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    // await readOCR();
    // await readBarcode();
  }

  Future readOCR() async {
    FirebaseVisionImage image = FirebaseVisionImage.fromFile(_image);
    TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizer.processImage(image);
    print('Text recognized: ${readText.text}');
  }

  Future readBarcode() async {
    FirebaseVisionImage image = FirebaseVisionImage.fromFile(_image);
    var barcodeDetector = FirebaseVision.instance.barcodeDetector(
      BarcodeDetectorOptions(barcodeFormats: BarcodeFormat.all),
    );
    var barcodes = await barcodeDetector.detectInImage(image);

    if (barcodes != null) {
      print('Barcodes found');
      print('Barcodes found: ${barcodes.length}');

      for (Barcode barcode in barcodes) {
        print(barcode.displayValue);
      }
    } else {
      print('No barcodes found');
    }
  }

  // render
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scann App'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: _image != null
                ? Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(_image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Text('Select an image'),
          ),
          RaisedButton(
            child: Text('Scan Text'),
            onPressed: readOCR,
          ),
          RaisedButton(
            child: Text('Scan Barcode'),
            onPressed: readBarcode,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: 'Pick an image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
