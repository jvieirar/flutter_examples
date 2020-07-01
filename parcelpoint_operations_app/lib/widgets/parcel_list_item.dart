import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parcelpoint_operations_app/model/parcel.dart';

class ParcelListItem extends StatelessWidget {
  // properties
  final Widget _iconBarcode = SvgPicture.asset(
    'assets/images/icon-barcode.svg',
    semanticsLabel: 'Parcel Icon',
  );
  final Parcel parcel;
  final BuildContext context;

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

  // constructors
  ParcelListItem({this.parcel, this.context});

  // methods

  // render
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
        child: ListTile(
          title: Text(parcel.externalId),
          subtitle: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 10.0,
                    child: _iconBarcode,
                  ),
                  Text(
                    parcel.consignmentRef,
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
                      decoration: parcelTypeContainerStyle,
                      child: Text(
                        parcel.parsedType,
                        style: parcelTypeStyle,
                      ),
                    ),
                    Text(
                      parcel.milkrunName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
