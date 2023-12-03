import 'package:formz/formz.dart';
import 'package:kalog_batangan_app/helpers/string_validators.dart';

enum PasswordValidatorError {
  tooShort,
  isEmpty,
  invalid,
  ;

  getMessage() {
    switch (this) {
      case tooShort:
        return 'Password is too short';
      case isEmpty:
        return 'Password is Empty';
      case invalid:
        return 'Must contain special characters and numbers';
    }
  }
}

class PasswordFormz extends FormzInput<String, PasswordValidatorError> {
  const PasswordFormz.pure() : super.pure('');

  const PasswordFormz.dirty(String value) : super.dirty(value);

  @override
  PasswordValidatorError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return PasswordValidatorError.isEmpty;
    }
    if (!PasswordSubmitRegExpValidator().isValid(value)) {
      return PasswordValidatorError.invalid;
    }

    if (!MinLengthStringValidator(8).isValid(value)) {
      print('fdfdfd');
      return PasswordValidatorError.tooShort;
    }
    return null;
  }
}
