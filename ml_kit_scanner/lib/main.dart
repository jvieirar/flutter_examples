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
  File _imageFile;
  List<Face> _faces;
  List<Barcode> _barcodes;
  final ImagePicker _picker = ImagePicker();

  // constructors

  // methods
  void _getImageAndDetectFaces() async {
    final imageFile = await _picker.getImage(source: ImageSource.gallery);
    final image = FirebaseVisionImage.fromFile(File(imageFile.path));
    final faceDetector = FirebaseVision.instance.faceDetector(
      FaceDetectorOptions(
        mode: FaceDetectorMode.accurate,
      ),
    );
    final faces = await faceDetector.processImage(image);

    // update state only if app mounted
    if (mounted) {
      setState(() {
        _imageFile = File(imageFile.path);
        _faces = faces;
      });
    }
  }

  void _getImageAndDetectBarcodes() async {
    final imageFile = await _picker.getImage(source: ImageSource.gallery);
    final image = FirebaseVisionImage.fromFile(File(imageFile.path));
    final barcodeDetector = FirebaseVision.instance.barcodeDetector(
      BarcodeDetectorOptions(barcodeFormats: BarcodeFormat.code128),
    );
    final barcodes = await barcodeDetector.detectInImage(image);
    print('barcodes detected: ${barcodes.length}');
    print(barcodes != null && barcodes.length > 0
        ? '${barcodes[0].rawValue}'
        : 'No barcodes');

    // update state only if app mounted
    if (mounted) {
      setState(() {
        _imageFile = File(imageFile.path);
        _barcodes = barcodes;
      });
    }
  }

  // render
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scann App'),
      ),
      body: Center(
        child: _imageFile != null && _barcodes != null
            ? Column(
                children: <Widget>[
                  Image.file(
                    _imageFile,
                  ),
                  ..._barcodes.map(
                      (barcode) => ListTile(title: Text(barcode.displayValue))),
                ],
              )
            : Text('Select an image'),
      ),
      // body: ImageAndFaces(
      //   imageFile: _imageFile,
      //   faces: _faces,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImageAndDetectBarcodes,
        tooltip: 'Pick an image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

// class ImageAndFaces extends StatelessWidget {
//   // properties
//   final File imageFile;
//   final List<Face> faces;

//   // constructors
//   ImageAndFaces({this.imageFile, this.faces});

//   // methods

//   // render
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Flexible(
//           flex: 2,
//           child: Container(
//             constraints: BoxConstraints.expand(),
//             child: imageFile != null
//                 ? Image.file(
//                     imageFile,
//                     // fit: BoxFit.cover,
//                   )
//                 : Text(''),
//           ),
//         ),
//         Flexible(
//           flex: 1,
//           child: ListView(
//             children: faces != null
//                 ? faces.map((f) => FaceCoordinates(f)).toList()
//                 : <Widget>[],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class FaceCoordinates extends StatelessWidget {
//   // properties
//   final Face face;

//   // constructors
//   FaceCoordinates(this.face);

//   // methods

//   // render
//   @override
//   Widget build(BuildContext context) {
//     final pos = face.boundingBox;
//     return ListTile(
//       title: Text('(${pos.top}, ${pos.left}), (${pos.bottom}, ${pos.right})'),
//     );
//   }
// }
