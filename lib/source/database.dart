import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalog_batangan_app/models/earthquake_event.dart';
import 'package:kalog_batangan_app/models/user_data.dart';

class DbFirestore {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference _eventColRef =
      _firestore.collection('events');
  static final CollectionReference _userColRef = _firestore.collection('users');
  // static Future registerEvent(EarthquakeEvent event) async {
  //   try {
  //     final eventDoc = await _eventColRef.doc(event.id).get();

  //     if (eventDoc.exists) return;
  //     final eventRef = _eventColRef
  //         .withConverter(
  //             fromFirestore: EarthquakeEvent.fromFirestore,
  //             toFirestore: (EarthquakeEvent event, options) =>
  //                 event.toFirestore())
  //         .doc(event.id);
  //     await eventRef.set(event);
  //   } catch (e) {}
  // }

  static Future addUser(UserData user) async {
    try {
      final userRef = _userColRef
          .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData user, options) => user.toFirestore())
          .doc(user.id);
      await userRef.set(user);
    } catch (e) {}
  }
}
