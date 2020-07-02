import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:parcelpoint_operations_app/model/parcel.dart';
import '../shared/icons.dart';

class ScanDialog extends StatelessWidget {
  // properties
  final Widget _iconLocalDelivery = SvgPicture.asset(
    'assets/images/local-delivery-logo.svg',
    semanticsLabel: 'Local Delivery Logo',
  );
  final Parcel parcel;
  final BuildContext context;
  final Function scan;

  // getters
  TextStyle get parcelTypeStyle {
    if (parcel.type == 'DELIVERY') {
      return TextStyle(
        color: Colors.white,
      );
    } else {
      return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
    }
  }

  Decoration get parcelTypeContainerStyle {
    if (parcel.type == 'DELIVERY') {
      return BoxDecoration(color: Theme.of(context).primaryColor);
    } else {
      return BoxDecoration(color: Color.fromRGBO(230, 230, 230, 1));
    }
  }

  TextStyle get parcelTypeBigStyle {
    if (parcel.type == 'DELIVERY') {
      return TextStyle(color: Colors.white, fontSize: 22);
    } else {
      return TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22);
    }
  }

  Decoration get parcelTypeBigContainerStyle {
    if (parcel.type == 'DELIVERY') {
      return BoxDecoration(color: Theme.of(context).primaryColor);
    } else {
      return BoxDecoration(color: Color.fromRGBO(230, 230, 230, 1));
    }
  }

  // constructors
  ScanDialog({this.parcel, this.context, this.scan});

  // methods
  void _close(context) => Navigator.of(context).pop();
  void _handleScan() {
    _close(context);
    scan();
  }

  // render
  @override
  Widget build(BuildContext context) {
    return parcel.externalId == null || parcel.externalId.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            height: 250,
            child: Column(
              children: [
                Container(
                  height: 35,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 32,
                    ),
                    onPressed: () => _close(context),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 1.0),
                              decoration: parcelTypeContainerStyle,
                              child: Text(
                                parcel.displayMilkrunName,
                                style: parcelTypeStyle,
                              ),
                            ),
                            Text(
                              parcel.displayId,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 12.0, bottom: 12.0),
                            child: Text(
                              'Terry White Chemmart Chatswood Chase Parcelpoint',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          decoration: parcelTypeBigContainerStyle,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (parcel.type == 'DELIVERY') _iconLocalDelivery,
                              Container(
                                margin: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  parcel.parsedType,
                                  style: parcelTypeBigStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: Text('Cancel'),
                        onPressed: () => _close(context),
                      ),
                      RaisedButton(
                        child: iconScan,
                        onPressed: _handleScan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Theme.of(context).accentColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
