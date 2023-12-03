import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:kalog_batangan_app/errors/exceptions.dart';
import 'package:kalog_batangan_app/features/login/entities/login_state.dart';
import 'package:kalog_batangan_app/forms/email.dart';
import 'package:kalog_batangan_app/forms/password.dart';
import 'package:kalog_batangan_app/repositories/authentication.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this._authenticationRepository) : super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  void updateEmail(String value) {
    final email = EmailFormz.dirty(value);
    state = state.copyWith(
      email: email,
      isValid: Formz.validate([
        email,
        state.password,
      ]),
    );
  }

  void updatePassword(String value) {
    final password = PasswordFormz.dirty(value);

    state = state.copyWith(
      password: password,
      isValid: Formz.validate([
        state.email,
        password,
      ]),
    );
  }

  void showHidePassword(bool value) {
    state = state.copyWith(
      hidePassword: !value,
      // isValid: Formz.validate([
      //   state.email,
      //   state.password,
      // ])
    );
  }

  void rememberMe(bool value) {
    state = state.copyWith(
        rememberMe: value,
        isValid: Formz.validate([state.email, state.password]));
  }

  Future<void> loginWithEmailAndPassword() async {
    if (!state.isValid) return;
    state = state.copyWith(status: FormzSubmissionStatus.inProgress);

    final ({String email, String password}) credentials =
        (email: state.email.value, password: state.password.value);
    try {
      await _authenticationRepository.login(credentials);
      state = state.copyWith(status: FormzSubmissionStatus.success);
    } on SignInWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
          errorMessage: e.message, status: FormzSubmissionStatus.failure);
    } finally {
      state = state.copyWith(status: FormzSubmissionStatus.initial);
    }
  }
}
