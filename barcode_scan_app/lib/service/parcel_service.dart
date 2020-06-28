import '../model/parcel.dart';
import '../model/agent.dart';

class ParcelService {
  // properties
  static final List<Parcel> _parcels = [
    Parcel(
      consignmentRef: '123412341234134',
      externalId: 'PP0001',
      agent: Agent(id: '2010-22', name: 'Parcelpoint HQ'),
    ),
    Parcel(
      consignmentRef: '111411141114134',
      externalId: 'PP0002',
      agent: Agent(id: '2010-23', name: 'Pharmacy Parcelpoint'),
    ),
    Parcel(
      consignmentRef: '125612561256156',
      externalId: 'PP0003',
      agent: Agent(id: '2010-22', name: 'Parcelpoint HQ'),
    ),
    Parcel(
      consignmentRef: '127812781278178',
      externalId: 'PP0004',
      agent: Agent(id: '2010-24', name: 'Petrol Station Parcelpoint'),
    ),
    Parcel(
      consignmentRef: '133313331333156',
      externalId: 'PP0005',
      agent: Agent(id: '2010-25', name: 'Market Parcelpoint'),
    ),
  ];

  // constructors

  // methods
  static Future<List<Parcel>> getAllParcels() async {
    return _parcels;
  }

  Future<Parcel> getParcelByConsignmentRef(String consingmentRef) async {
    return _parcels
            .singleWhere((parcel) => parcel.consignmentRef == consingmentRef) ??
        null;
  }
}
