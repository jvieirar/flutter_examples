import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final Widget iconParcel = SvgPicture.asset(
  'assets/images/icon-parcel.svg',
  semanticsLabel: 'Parcel Icon',
);
final Widget iconScan = SvgPicture.asset(
  'assets/images/icon-qr-barcode.svg',
  semanticsLabel: 'Scan Icon',
  color: Colors.white,
);
