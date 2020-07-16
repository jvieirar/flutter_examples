import 'dart:convert';
import 'package:http/http.dart';
import 'package:parcelpoint_operations_app/model/parcel.dart';

class ParcelService {
  final String milkrunUrl =
      'https://api.staging.parcelpoint.com.au/api/v1/milkrun/agent'; // ?agentId=2010-06
  final String parcelSearchUrl =
      'https://api.staging.parcelpoint.com.au/api/1/parcel/search'; // ?identifier=CPAP97A1166786
  final String statusChangeUrl =
      'https://api.staging.parcelpoint.com.au/api/v1/parcel/state/change'; // ?apiKey=4JKLI3GW
  // {
  //   "id": "PMDDFZF4",
  //   "toStatus":"SORTED"
  // }

  Future<String> getMilkrunNameByAgentId(String agentId) async {
    Response res = await get('$milkrunUrl?agentId=$agentId');

    if (res.statusCode == 200) {
      var milkrunDetails = jsonDecode(res.body);
      String milkrunName = milkrunDetails['runName'];
      print(milkrunName);
      return milkrunName;
    } else {
      throw 'Error fetching milkrun';
    }
  }

  Future<Parcel> getParcelInfoByConsigment(String consignmentRef) async {
    Response res = await get('$parcelSearchUrl?identifier=$consignmentRef');

    if (res.statusCode == 200) {
      var parcelDetailsList = jsonDecode(res.body);
      if (parcelDetailsList != null && (parcelDetailsList as List).isNotEmpty) {
        var parcelDetails = parcelDetailsList[0];
        var fulfilment = parcelDetails['original_fullfilment_type'];
        var parcelType = parcelDetails['type'];
        var orderType = parcelDetails['order_type'];
        var parcel = Parcel(
          externalId: parcelDetails['parcel_id'],
          consignmentRef: parcelDetails['consignment_reference'],
          type: orderType == 'DELIVERY' && fulfilment == 'Warehouse_To_Address'
              ? 'DELIVERY'
              : parcelType,
          agentId: parcelDetails['agent_id'],
          agentName: parcelDetails['agent_name'],
        );
        print(parcel.externalId);
        return parcel;
      } else {
        return null;
      }
    } else {
      throw 'Error fetching milkrun';
    }
  }

  Future<void> markAsSorted(String externalId) async {
    Response res = await post('$statusChangeUrl?apiKey=4JKLI3GW',
        body: {'id': externalId, 'toStatus': 'SORTED'});
    var body = jsonDecode(res.body);
    if (body['responseType'] != null && body['responseType'] == 'Failure') {
      print('Status not moved for parcel "$externalId"');
    } else {
      print('Status moved to SORTED for parcel "$externalId"');
    }
  }
}
