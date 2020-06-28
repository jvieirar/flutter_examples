import 'package:flutter/material.dart';

import '../model/parcel.dart';
import 'parcel_list_item.dart';

class ParcelList extends StatelessWidget {
  // properties
  final List<Parcel> parcels;

  // constructors
  ParcelList(this.parcels);

  // methods
  List<ParcelListItem> getParcelListItems() {
    return parcels.map((parcel) => ParcelListItem(parcel)).toList();
  }

  // render
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: getParcelListItems(),
      ).toList(),
    );
  }
}
