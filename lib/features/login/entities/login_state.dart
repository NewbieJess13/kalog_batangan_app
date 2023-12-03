import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kalog_batangan_app/forms/email.dart';
import 'package:kalog_batangan_app/forms/password.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState(
      {@Default(EmailFormz.pure()) EmailFormz email,
      @Default(PasswordFormz.pure()) PasswordFormz password,
      @Default(false) bool rememberMe,
      @Default(true) bool hidePassword,
      @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
      @Default(false) bool isValid,
      String? errorMessage}) = _LoginState;
}
