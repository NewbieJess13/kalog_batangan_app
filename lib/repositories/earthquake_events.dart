import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kalog_batangan_app/global_providers.dart';
import 'package:kalog_batangan_app/models/earthquake_event.dart';

final earthquakeEventsStreamProvider =
    StreamProvider<List<EarthquakeEventModel>>((ref) {
  final service = EarthquakeEventsRepository(ref.read(firestoreProvider));
  service._init();
  return service._stream;
});

final earthquakeEventRepoProvider = Provider<EarthquakeEventsRepository>((ref) {
  final service = EarthquakeEventsRepository(ref.read(firestoreProvider));
  service._init();
  return service;
});

class EarthquakeEventsRepository {
  final FirebaseFirestore firestore;

  EarthquakeEventsRepository(this.firestore);

  late Stream<List<EarthquakeEventModel>> _stream;
  Future _init() async {
    final Query eventsQuery = firestore.collection('events');
    final eventsRef = eventsQuery.withConverter(
        fromFirestore: EarthquakeEventModel.fromFirestore,
        toFirestore: (event, options) => event.toFirestore());

    final dateToday = DateFormat("dd MMM yyyy").format(DateTime.now());
    final Stream<QuerySnapshot<EarthquakeEventModel>> snapshots = eventsRef
        .where('date', isEqualTo: dateToday)
        // .orderBy(field)
        .snapshots();
    _stream = snapshots.map((snapshot) {
      final result = snapshot.docs.map((e) => e.data()).toList();

      return result;
    });
  }

  Stream<List<EarthquakeEventModel>> stream() {
    return _stream;
  }

  Future<List<EarthquakeEventModel>> getEvents() async {
    final Query eventsQuery = firestore.collection('events');
    final eventsRef = eventsQuery.withConverter(
        fromFirestore: EarthquakeEventModel.fromFirestore,
        toFirestore: (event, options) => event.toFirestore());
    List<EarthquakeEventModel> result = [];
    final dateToday = DateFormat("dd MMM yyyy").format(DateTime.now());
    final snapshots = eventsRef.where('date', isEqualTo: dateToday).get();
    print(snapshots);
    await snapshots.then((snapshots) {
      for (var doc in snapshots.docs) {
        result.add(doc.data());
      }
    });
    return result;
  }
}
