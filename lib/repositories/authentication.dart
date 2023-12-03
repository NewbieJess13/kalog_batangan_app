import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kalog_batangan_app/errors/exceptions.dart';

class AuthenticationRepository {
  final FirebaseAuth firebaseAuth;

  AuthenticationRepository(this.firebaseAuth);

  Stream<User?> get currentUser {
    return firebaseAuth.authStateChanges();
  }

  Future login(({String email, String password}) credentials) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: credentials.email, password: credentials.password);
    } on FirebaseAuthException catch (e) {
      throw SignInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignInWithEmailAndPasswordFailure();
    }
  }

  Future<String?> signup(({String email, String password}) credentials) async {
    try {
      final authCred = await firebaseAuth.createUserWithEmailAndPassword(
          email: credentials.email, password: credentials.password);
      return authCred.user?.uid;
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  Future logout() async {
    await firebaseAuth.signOut();
  }
}
