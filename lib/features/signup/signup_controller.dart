import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:kalog_batangan_app/errors/exceptions.dart';
import 'package:kalog_batangan_app/features/signup/entities/signup_state.dart';
import 'package:kalog_batangan_app/forms/confirm_password.dart';
import 'package:kalog_batangan_app/forms/email.dart';
import 'package:kalog_batangan_app/forms/password.dart';
import 'package:kalog_batangan_app/forms/phone.dart';
import 'package:kalog_batangan_app/models/user_data.dart';
import 'package:kalog_batangan_app/repositories/authentication.dart';
import 'package:kalog_batangan_app/repositories/user.dart';

class SignupController extends StateNotifier<SignUpState> {
  SignupController(this._authenticationRepository, this._userRepository)
      : super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  void updateEmail(String value) {
    final email = EmailFormz.dirty(value);
    state = state.copyWith(
      email: email,
      isValid: Formz.validate(
          [email, state.password, state.confirmPassword, state.phone]),
    );
  }

  void updatePassword(String value) {
    final password = PasswordFormz.dirty(value);
    state = state.copyWith(
      password: password,
      isValid: Formz.validate(
          [state.email, password, state.confirmPassword, state.phone]),
    );
  }

  void updateConfirmPassword(String value) {
    final confirmPassword = ConfirmPasswordFormz.dirty(
        password: state.password.value, value: value);
    state = state.copyWith(
      confirmPassword: confirmPassword,
      isValid: Formz.validate(
          [state.email, state.password, confirmPassword, state.phone]),
    );
  }

  void showHidePassword(bool value) {
    state = state.copyWith(
      hidePassword: !value,
    );
  }

  void showHideConfirmPassword(bool value) {
    state = state.copyWith(
      hideConfirmPassword: !value,
    );
  }

  void updatePhone(String value) {
    final phone = PhoneFormz.dirty(value);
    state = state.copyWith(
      phone: phone,
      isValid: Formz.validate(
          [state.email, state.password, state.confirmPassword, phone]),
    );
  }

  Future<void> signupUser(UserData user) async {
    if (!state.isValid) return;
    state = state.copyWith(status: FormzSubmissionStatus.inProgress);

    final ({String email, String password}) credentials =
        (email: state.email.value, password: state.password.value);
    try {
      String? uid = await _authenticationRepository.signup(credentials);
      if (uid != null) {
        await _userRepository.saveUserDetails(user, uid);
        await _userRepository.savePhoneNum(user.phoneNumber!);
      }
      state = state.copyWith(status: FormzSubmissionStatus.success);
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
          errorMessage: e.message, status: FormzSubmissionStatus.failure);
    } finally {
      state = state.copyWith(status: FormzSubmissionStatus.initial);
    }
  }
}
