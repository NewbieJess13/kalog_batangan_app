import 'package:formz/formz.dart';

enum PhoneValidationError {
  invalid,
  isEmpty;

  getMessage() {
    switch (this) {
      case invalid:
        return 'Invalid phone number';

      case isEmpty:
        return 'This can\'t be empty';
    }
  }
}

class PhoneFormz extends FormzInput<String, PhoneValidationError> {
  const PhoneFormz.pure() : super.pure('');
  const PhoneFormz.dirty([super.value = ""]) : super.dirty();

  @override
  PhoneValidationError? validator(String value) {
    if (value.length != 13) {
      return PhoneValidationError.invalid;
    }
    if (value.isEmpty) {
      return PhoneValidationError.isEmpty;
    }
    return null;
  }
}

// class FirstName extends Name {
//   const FirstName.pure() : super.pure();
//   const FirstName.dirty([super.value = ""]) : super.dirty();
// }

// class LastName extends Name {
//   const LastName.pure() : super.pure();
//   const LastName.dirty([super.value = ""]) : super.dirty();
// }
