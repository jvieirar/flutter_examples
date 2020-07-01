import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:barcode_scan/barcode_scan.dart';

import '../model/parcel.dart';
import '../widgets/parcel_list_item.dart';
import '../widgets/scan_dialog.dart';
import '../shared/icons.dart';

class ParcelPage extends StatefulWidget {
  ParcelPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ParcelPageState createState() => _ParcelPageState();
}

class _ParcelPageState extends State<ParcelPage> {
  // properties

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        ),
        builder: (bCtx) {
          return ScanDialog(
            barcode: barcode,
          );
        });
  }

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
                  child: iconParcel,
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
        child: iconScan,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
