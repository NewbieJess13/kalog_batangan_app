import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kalog_batangan_app/forms/confirm_password.dart';
import 'package:kalog_batangan_app/forms/email.dart';
import 'package:kalog_batangan_app/forms/password.dart';
import 'package:kalog_batangan_app/forms/phone.dart';

part 'signup_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState(
      {@Default(EmailFormz.pure()) EmailFormz email,
      @Default(PasswordFormz.pure()) PasswordFormz password,
      @Default(ConfirmPasswordFormz.pure())
      ConfirmPasswordFormz confirmPassword,
      @Default(true) bool hidePassword,
      @Default(true) bool hideConfirmPassword,
      @Default(PhoneFormz.pure()) PhoneFormz phone,
      @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
      @Default(false) bool isValid,
      String? errorMessage}) = _SignUpState;
}
