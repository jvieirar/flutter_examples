import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:barcode_scan/barcode_scan.dart';

import '../model/parcel.dart';
import '../widgets/parcel_list_item.dart';
import '../widgets/scan_dialog.dart';
import '../shared/icons.dart';
import '../service/parcel_service.dart';

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
      // milkrunName: 'INNER WEST',
    ),
    Parcel(
      externalId: 'PPSZ39T6',
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
      externalId: 'PPSZ36K6',
      consignmentRef: '00991234049505',
      type: 'RETURNS',
      agentName: 'Rakoty Pharmacy Parcelpoint',
      milkrunName: 'INNER WEST',
    ),
  ];

  ParcelService _parcelService = ParcelService();

  Parcel _selectedParcel = Parcel(
    // externalId: 'PPSZ33K3',
    externalId: '',
    consignmentRef: '00991234049706',
    type: 'DELIVERY',
    agentName: 'Bondi Junction Parcelpoint',
    milkrunName: 'SYDNEY CBD',
  );

  // methods
  void _addParcel(Parcel parcel) {
    setState(() {
      _parcels.add(parcel);
    });
  }

  Future _scanBarcode() async {
    try {
      ScanResult barcodeScanned = await BarcodeScanner.scan();
      if (mounted) {
        if (barcodeScanned.rawContent.isNotEmpty) {
          try {
            // call parcel search api
            var newParcel = await _parcelService
                .getParcelInfoByConsigment(barcodeScanned.rawContent);

            print('Got parcel: ${newParcel.externalId}');
            if (newParcel?.externalId != null) {
              // call milkrun api
              try {
                var milkrunName = await _parcelService
                    .getMilkrunNameByAgentId(newParcel.agentId);
                newParcel.milkrunName = milkrunName;
                print(
                    'Milkrun "$milkrunName" fetched correctly for parcel "${newParcel.externalId}"');
                // var newParcel = Parcel(
                //     agentName: agentName,
                //     externalId: agentId,
                //     agentId: agentId,
                //     consignmentRef: barcodeScanned.rawContent,
                //     milkrunName: milkrunName,
                //     type: 'DELIVERY');
              } catch (error) {
                print(error);
              }

              setState(() {
                _barcode = barcodeScanned.rawContent;
                _selectedParcel = newParcel;
                _addParcel(newParcel);
              });

              try {
                _parcelService.markAsSorted(newParcel.externalId);
              } catch (error) {
                // status change error
                print(
                    'Got error changing status for parcel ${newParcel.externalId}');
              }

              _showScanDialog(context, _selectedParcel);
            }
          } catch (error) {
            // parcel search error
            print('Error on parcel search');
            print(error);
          }
        }
      }
    } catch (e) {
      setState(() {
        _barcode = e.toString();
      });
    }
  }

  void _showScanDialog(BuildContext ctx, Parcel parcel) {
    showModalBottomSheet(
        context: ctx,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        ),
        builder: (bCtx) {
          return ScanDialog(
            context: context,
            parcel: _selectedParcel,
            scan: _scanBarcode,
          );
        });
  }

  void _handleParcelOnPress(Parcel parcel) {
    setState(() {
      _selectedParcel = parcel;
    });
    _showScanDialog(context, parcel);
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
                  onPress: _handleParcelOnPress),
            ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => _showScanDialog(context, 'barcode test'),
        onPressed: _scanBarcode,
        tooltip: 'Scan',
        child: iconScan,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
