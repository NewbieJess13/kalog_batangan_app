import 'package:formz/formz.dart';
import 'package:kalog_batangan_app/forms/password.dart';
import 'package:kalog_batangan_app/helpers/string_validators.dart';

enum ConfirmPasswordValidatorError {
  notMatch,
  isEmpty;

  getMessage() {
    switch (this) {
      case notMatch:
        return 'Password did not match';
      case isEmpty:
        return 'Password is Empty';
    }
  }
}

class ConfirmPasswordFormz
    extends FormzInput<String, ConfirmPasswordValidatorError> {
  const ConfirmPasswordFormz.pure({this.password = ''}) : super.pure('');

  const ConfirmPasswordFormz.dirty({required this.password, String value = ''})
      : super.dirty(value);

  final String password;

  @override
  ConfirmPasswordValidatorError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return ConfirmPasswordValidatorError.isEmpty;
    }
    if (password != value) {
      return ConfirmPasswordValidatorError.notMatch;
    }

    return null;
  }
}
