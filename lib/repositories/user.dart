import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalog_batangan_app/global_providers.dart';
import 'package:kalog_batangan_app/models/user_data.dart';

final userRepoProvider = Provider<UserRepository>((ref) {
  final service = UserRepository(ref.read(firestoreProvider));

  return service;
});

class UserRepository {
  final FirebaseFirestore firestore;

  UserRepository(this.firestore);

  Future saveUserDetails(UserData user, String uid) async {
    final CollectionReference userColRef = firestore.collection('users');

    try {
      final userRef = userColRef
          .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData user, options) => user.toFirestore())
          .doc(uid);

      await userRef.set(user, SetOptions(merge: true));
    } catch (e) {}
  }

  Future<UserData?> getUserDetails(String uid) async {
    final CollectionReference userColRef = firestore.collection('users');

    try {
      final userRef = userColRef
          .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData user, options) => user.toFirestore())
          .doc(uid);

      DocumentSnapshot<UserData> user = await userRef.get();

      return user.data();
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future savePhoneNum(String num) async {
    final CollectionReference contactsColRef = firestore.collection('numbers');
    try {
      contactsColRef.doc(num).set({"phone_num": num});
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
