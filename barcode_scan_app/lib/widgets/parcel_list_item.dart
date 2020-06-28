import 'package:flutter/material.dart';

import '../model/parcel.dart';

class ParcelListItem extends StatelessWidget {
  // properties
  final Parcel parcel;

  // constructors
  ParcelListItem(this.parcel);

  // methods

  // render
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(parcel.externalId),
      subtitle: Text(parcel.consignmentRef),
      trailing: Text(parcel.agent?.name),
    );
  }
}
