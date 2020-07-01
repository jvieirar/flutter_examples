import 'package:flutter/material.dart';

import '../shared/icons.dart';

class ScanDialog extends StatelessWidget {
  // properties
  final String barcode;

  // constructors
  ScanDialog({this.barcode});

  // methods
  void _close(context) => Navigator.of(context).pop();

  // render
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 32,
            ),
            onPressed: () => _close(context),
          ),
          Card(
            elevation: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('EASTERN SUBURBS'),
                      Text('PM JKM LD2'),
                    ],
                  ),
                  Text(
                    'Terry White Chemmart Chatswood Chase Parcelpoint',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('LOCAL DELIVERY'),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text('Cancel'),
                onPressed: () => _close(context),
              ),
              RaisedButton(
                child: iconScan,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Theme.of(context).accentColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
