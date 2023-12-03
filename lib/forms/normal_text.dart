import 'package:formz/formz.dart';

enum NormalTextValidationError {
  isEmpty;

  getMessage() {
    switch (this) {
      case isEmpty:
        return 'This can\'t be empty';
    }
  }
}

class NormalTextFormz extends FormzInput<String, NormalTextValidationError> {
  const NormalTextFormz.pure() : super.pure('');
  const NormalTextFormz.dirty([super.value = ""]) : super.dirty();

  @override
  NormalTextValidationError? validator(String value) {
    if (value.isEmpty) {
      return NormalTextValidationError.isEmpty;
    }

    return null;
  }
}
