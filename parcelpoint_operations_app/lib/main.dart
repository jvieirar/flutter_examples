import 'package:flutter/material.dart';
import 'package:parcelpoint_operations_app/pages/parcels_page.dart';

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
      home: ParcelPage(title: 'Parcels'),
    );
  }
}
