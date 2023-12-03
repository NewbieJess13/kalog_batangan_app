import 'package:formz/formz.dart';

enum NameValidationError {
  invalid,
  tooShort,
  isEmpty;

  getMessage() {
    switch (this) {
      case invalid:
        return 'Name can\'t contain numbers or special characters';
      case tooShort:
        return 'Name too short, should be atleast 2 characters';
      case isEmpty:
        return 'This can\'t be empty';
    }
  }
}

class NameFormz extends FormzInput<String, NameValidationError> {
  const NameFormz.pure() : super.pure('');
  const NameFormz.dirty([super.value = ""]) : super.dirty();

  static final RegExp _nameRegExp = RegExp(
    r'^[a-zA-Z]*$',
  );

  @override
  NameValidationError? validator(String value) {
    if (!_nameRegExp.hasMatch(value)) {
      return NameValidationError.invalid;
    }
    if (value.length < 2) {
      return NameValidationError.tooShort;
    }
    if (value.isEmpty) {
      return NameValidationError.isEmpty;
    }

    return null;
  }
}
