import 'package:flutter/foundation.dart';
// import 'package:dartx/dartx.dart';
import '../utils/string_utils.dart';

class Parcel {
  // properties
  String externalId;
  String consignmentRef;
  String type;
  String agentName;
  String agentId;
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

  String get displayId {
    if (externalId.length >= 8) {
      // var id = externalId.split('');
      // print(id);
      // return '${id.slice(0, 1).join()} ${id.slice(2, 4).join()} ${id.slice(5).join()}';
      return '${externalId.slice(0, 2)} ${externalId.slice(2, 5)} ${externalId.slice(5)}';
    } else {
      return externalId;
    }
  }

  String get displayMilkrunName {
    return milkrunName?.toUpperCase();
  }

  // constructors
  Parcel({
    @required this.externalId,
    @required this.type,
    @required this.consignmentRef,
    @required this.agentName,
    this.milkrunName,
    this.scannedOn,
    this.agentId,
  });
}
