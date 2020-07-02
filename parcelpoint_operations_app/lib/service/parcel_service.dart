import 'dart:convert';
import 'package:http/http.dart';

class ParcelService {
  final String milkrunUrl =
      'https://api.staging.parcelpoint.com.au/api/v1/milkrun/agent'; // ?agentId=2010-06

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
}
