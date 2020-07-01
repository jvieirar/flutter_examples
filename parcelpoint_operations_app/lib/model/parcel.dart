import 'package:flutter/foundation.dart';

class Parcel {
  // properties
  String externalId;
  String consignmentRef;
  String type;
  String agentName;
  String milkrunName;
  DateTime scannedOn = DateTime.now();

  // getters
  String get parsedType {
    switch (type) {
      case 'COLLECT_INITIAL_RETAILER':
        return 'CLICK&COLLECT';
      case 'DELIVERY':
        return 'LOCAL DELIVERY';
      case 'RETURN_RETAILER_FORM':
        return 'RETURNS';
      default:
        return type;
    }
  }

  // constructors
  Parcel({
    @required this.externalId,
    @required this.type,
    @required this.consignmentRef,
    @required this.agentName,
    @required this.milkrunName,
    this.scannedOn,
  });
}
