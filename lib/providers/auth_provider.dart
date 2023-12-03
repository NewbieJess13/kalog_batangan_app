import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalog_batangan_app/features/login/entities/login_state.dart';
import 'package:kalog_batangan_app/features/login/login_controller.dart';
import 'package:kalog_batangan_app/features/signup/entities/signup_state.dart';
import 'package:kalog_batangan_app/features/signup/entities/user_details_state.dart';
import 'package:kalog_batangan_app/features/signup/signup_controller.dart';
import 'package:kalog_batangan_app/features/signup/user_details_controller.dart';
import 'package:kalog_batangan_app/global_providers.dart';
import 'package:kalog_batangan_app/repositories/authentication.dart';
import 'package:kalog_batangan_app/repositories/user.dart';

final authProvider = StreamProvider<User?>((ref) {
  FirebaseAuth firebaseAuth = ref.read(firebaseAuthProvider);
  final AuthenticationRepository repository =
      AuthenticationRepository(firebaseAuth);
  return repository.currentUser;
});

final signUpProvider =
    StateNotifierProvider.autoDispose<SignupController, SignUpState>((ref) {
  FirebaseAuth firebaseAuth = ref.read(firebaseAuthProvider);
  FirebaseFirestore firestore = ref.read(firestoreProvider);
  final AuthenticationRepository authRepository =
      AuthenticationRepository(firebaseAuth);
  final UserRepository userRepository = UserRepository(firestore);
  return SignupController(authRepository, userRepository);
});

final loginProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>((ref) {
  FirebaseAuth firebaseAuth = ref.read(firebaseAuthProvider);
  final AuthenticationRepository repository =
      AuthenticationRepository(firebaseAuth);
  return LoginController(repository);
});

final userDetailsProvider =
    StateNotifierProvider.autoDispose<UserDetailsController, UserDetailsState>(
        (ref) => UserDetailsController());
