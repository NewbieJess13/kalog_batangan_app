import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalog_batangan_app/global_providers.dart';
import 'package:kalog_batangan_app/models/user_data.dart';

class UserRepository {
  final FirebaseFirestore firestore;

  UserRepository(this.firestore);

  Future saveUserDetails(UserData user) async {
    final CollectionReference _userColRef = firestore.collection('users');

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
