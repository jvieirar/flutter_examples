import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'model/parcel.dart';
import 'widgets/parcel_list_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parcelpoint',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Scandia',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Scandia',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              headline5: TextStyle(
                fontFamily: 'Scandia',
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Scandia',
                  // fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
        ),
      ),
      home: MyHomePage(title: 'Parcels'),
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
  final Widget _iconParcel = SvgPicture.asset(
    'assets/images/icon-parcel.svg',
    semanticsLabel: 'Parcel Icon',
  );

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
        onPressed: () {},
        tooltip: 'Scan',
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
