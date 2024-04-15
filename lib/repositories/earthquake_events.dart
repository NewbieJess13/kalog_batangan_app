import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kalog_batangan_app/global_providers.dart';
import 'package:kalog_batangan_app/models/earthquake_event.dart';
import 'package:kalog_batangan_app/services/sms_service.dart';

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

  Future<void> addNewEarthquakeEvent() async {
    final smsService = SmsService();

    String customId = DateFormat("yyyy_MMdd_hhmm").format(DateTime.now());
    late List<String> contacts = [];
    final eventMap = {
      "event_id": customId,
      "date": DateFormat("dd MMM yyyy").format(DateTime.now()),
      "time": DateFormat("hh:mm:ss a").format(DateTime.now()),
      "timestamp": DateTime.now().millisecondsSinceEpoch,
      "location": "14.0147808,120.9824568 of Taal Crater(Batangas)",
      "depth": "123",
      "origin": "VOLCANIC",
      "magnitude": "Ms 3.5",
      "expect_damage": "NO",
      "expect_aftershocks": "YES",
    };

    await firestore.collection('numbers').get().then((snapshot) {
      snapshot.docs.forEach((element) {
        contacts.add(element.data()['phone_num']);
      });
    });

    await firestore.collection("events").doc(customId).set(eventMap);

    String message =
        "From Kalog Batangan,\n\n Alert level 4 has been raised in Taal Volcano, you may now proceed to your designated evacuation centers.\nYou can check the Centers menu for the nearest and assigned evacuation center. For more info and help you can contact the local PDRRMO office at (043) 786 0693, Keep safe mga Kabayan.";

    print('$contacts,$message');

    await smsService.sendSms(contacts, message);
  }

  Future<List<EarthquakeEventModel>> getEvents() async {
    final Query eventsQuery = firestore.collection('events');
    final eventsRef = eventsQuery.withConverter(
        fromFirestore: EarthquakeEventModel.fromFirestore,
        toFirestore: (event, options) => event.toFirestore());
    List<EarthquakeEventModel> result = [];
    final dateToday = DateFormat("dd MMM yyyy").format(DateTime.now());
    final snapshots = eventsRef
        .orderBy("timestamp", descending: true)
        // .where('date', isEqualTo: dateToday)
        .get();
    print(snapshots);
    await snapshots.then((snapshots) {
      for (var doc in snapshots.docs) {
        if (doc.data().date == dateToday) {
          result.add(doc.data());
        }
      }
    });
    return result;
  }
}
