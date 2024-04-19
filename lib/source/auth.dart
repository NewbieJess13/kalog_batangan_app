import 'package:firebase_auth/firebase_auth.dart';
import 'package:kalog_batangan_app/models/user_data.dart';
import 'package:kalog_batangan_app/source/database.dart';

class FbAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  Future loginViaEmail(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {}
  }

  Future signUpAccount(UserData user) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: user.emailAddress!.trim(), password: user.password!.trim());

      await DbFirestore.addUser(user);
    } on FirebaseAuthException catch (e) {}
  }

  // static Future verifyPhoneNumber(UserData user) async {
  //   user = UserData(phoneNumber: '+639566683277');
  //   print(user.phoneNumber);
  //   try {
  //     await _auth.verifyPhoneNumber(
  //       phoneNumber: user.phoneNumber,
  //       verificationCompleted: (cred) {},
  //       verificationFailed: (authException) {},
  //       codeSent: (verificationId, forceResendingToken) {},
  //       codeAutoRetrievalTimeout: (verificationId) {},
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future loginViaGoogle() async {}

  Future signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {}
  }
}
