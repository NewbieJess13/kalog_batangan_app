import 'package:cloud_firestore/cloud_firestore.dart';

class EvacCenterModel {
  final String? evacCenterName;
  final GeoPoint? location;

  EvacCenterModel({this.evacCenterName, this.location});

  factory EvacCenterModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    if (data == null) {
      return EvacCenterModel();
    }
    return EvacCenterModel(
        evacCenterName: data['name'], location: data['location']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (evacCenterName != null) "name": evacCenterName,
      if (location != null) "location": location,
    };
  }
}
