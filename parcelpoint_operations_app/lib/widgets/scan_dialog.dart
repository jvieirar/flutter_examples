import 'package:flutter/material.dart';

class ScanDialog extends StatelessWidget {
  // properties
  final String barcode;

  // constructors
  ScanDialog({this.barcode});

  // methods

  // render
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text(barcode),
          ),
        ],
      ),
    );
  }
}
