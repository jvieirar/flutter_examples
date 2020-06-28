import 'agent.dart';

class Parcel {
  String consignmentRef;
  String externalId;
  Agent agent;

  Parcel({this.externalId, this.consignmentRef, this.agent});
}
