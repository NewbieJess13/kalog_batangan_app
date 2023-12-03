import 'package:formz/formz.dart';
import 'package:kalog_batangan_app/helpers/string_validators.dart';

enum EmailValidatorError {
  empty,
  invalid,
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return "Email can't be empty";
      case invalid:
        return "Invalid email";
    }
  }
}

class EmailFormz extends FormzInput<String, EmailValidatorError> {
  const EmailFormz.pure() : super.pure('');

  const EmailFormz.dirty(String value) : super.dirty(value);

  @override
  EmailValidatorError? validator(String value) {
    if (value.length < 4) return EmailValidatorError.empty;

    if (!EmailSubmitRegExpValidator().isValid(value)) {
      return EmailValidatorError.invalid;
    }

    return null;
  }
}
