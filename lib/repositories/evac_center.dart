import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalog_batangan_app/models/evac_center.dart';

class EvacCenterRepository {
  final FirebaseFirestore firestore;

  EvacCenterRepository(this.firestore);

  Future<List<EvacCenterModel>> getCenters() async {
    final Query eventsQuery = firestore.collection('evac_centers');
    final eventsRef = eventsQuery.withConverter(
        fromFirestore: EvacCenterModel.fromFirestore,
        toFirestore: (center, options) => center.toFirestore());

    List<EvacCenterModel> result = [];
    final snapshots = eventsRef.get();

    await snapshots.then((snapshots) {
      for (var doc in snapshots.docs) {
        result.add(doc.data());
      }
    });
    return result;
  }
}
