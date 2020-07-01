import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:barcode_scan/barcode_scan.dart';

import '../model/parcel.dart';
import '../widgets/parcel_list_item.dart';
import '../widgets/scan_dialog.dart';

class ParcelPage extends StatefulWidget {
  ParcelPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ParcelPageState createState() => _ParcelPageState();
}

class _ParcelPageState extends State<ParcelPage> {
  // properties
  final Widget _iconParcel = SvgPicture.asset(
    'assets/images/icon-parcel.svg',
    semanticsLabel: 'Parcel Icon',
  );
  final Widget _iconScan = SvgPicture.asset(
    'assets/images/icon-qr-barcode.svg',
    semanticsLabel: 'Scan Icon',
    color: Colors.white,
  );

  String _barcode = '';

  List<Parcel> _parcels = [
    Parcel(
      externalId: 'PPSZ32K2',
      consignmentRef: '00991234049203',
      type: 'DELIVERY',
      agentName: 'Parcelpoint HQ',
      milkrunName: 'EASTER SUBURBS',
    ),
    Parcel(
      externalId: 'PPSZ32K1',
      consignmentRef: '00991234049305',
      type: 'COLLECT_INITIAL_RETAILER',
      agentName: 'Randwick Parcelpoint',
      milkrunName: 'INNER WEST',
    ),
    Parcel(
      externalId: 'PPSZ33K3',
      consignmentRef: '00991234049706',
      type: 'DELIVERY',
      agentName: 'Bondi Junction Parcelpoint',
      milkrunName: 'SYDNEY CBD',
    ),
    Parcel(
      externalId: 'PPSZ34K4',
      consignmentRef: '00991234049907',
      type: 'COLLECT_INITIAL_RETAILER',
      agentName: 'Rakoty Pharmacy Parcelpoint',
      milkrunName: 'EASTER SUBURBS',
    ),
    Parcel(
      externalId: 'PPSZ35K5',
      consignmentRef: '00991234049102',
      type: 'COLLECT_INITIAL_RETAILER',
      agentName: 'Parcelpoint HQ',
      milkrunName: 'EASTER SUBURBS',
    ),
    Parcel(
      externalId: 'PPSZ36K6',
      consignmentRef: '00991234049505',
      type: 'RETURNS',
      agentName: 'Rakoty Pharmacy Parcelpoint',
      milkrunName: 'INNER WEST',
    ),
  ];

  // methods
  Future _scanBarcode() async {
    try {
      ScanResult barcode = await BarcodeScanner.scan();
      if (mounted) {
        setState(() {
          _barcode = barcode.rawContent;
        });
        // await _showScanDialog(barcode.rawContent);
        await _showScanDialog(context, barcode.rawContent);
      }
    } catch (e) {
      setState(() {
        _barcode = e.toString();
      });
    }
  }

  void _showScanDialog(BuildContext ctx, String barcode) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return ScanDialog(
            barcode: barcode,
          );
        });
  }

  // Future<void> _showScanDialog(String result) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Agent information'),
  //         content: SingleChildScrollView(
  //           child: Text(result),
  //         ),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('Close'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           RaisedButton(
  //             child: Text('Continue scanning'),
  //             onPressed: () {
  //               _scanBarcode();
  //               Navigator.of(context).pop();
  //             },
  //             color: Theme.of(context).primaryColor,
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // render
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8.0),
                  child: _iconParcel,
                ),
                Text(
                  _parcels.length.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                )
              ],
            ),
          ),
        ],
      ),
      body: _parcels.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Please, scan a Parcel',
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _parcels.length,
              itemBuilder: (context, index) => ParcelListItem(
                parcel: _parcels[index],
                context: context,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showScanDialog(context, 'barcode test'),
        // onPressed: _scanBarcode,
        tooltip: 'Scan',
        child: _iconScan,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
