abstract class StringValidator {
  bool isValid(String value);
}

class RegexValidator implements StringValidator {
  final String regexSource;

  RegexValidator({required this.regexSource});

  @override
  bool isValid(String value) {
    try {
      final RegExp regex = RegExp(regexSource);
      final Iterable<Match> matches = regex.allMatches(value);

      for (final match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }

      return false;
    } catch (e) {
      assert(false, e.toString());
      return true;
    }
  }
}

class EmailSubmitRegExpValidator extends RegexValidator {
  EmailSubmitRegExpValidator()
      : super(
            regexSource: r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)');
}

class PasswordSubmitRegExpValidator extends RegexValidator {
  PasswordSubmitRegExpValidator()
      : super(
            regexSource:
                r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*();:,."-_/#?&])[A-Za-z\d@$!%*();:,."-_/#?&]{8,}$');
}

class NonEmptyStringValidator extends StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class MinLengthStringValidator extends StringValidator {
  final int minLength;

  MinLengthStringValidator(this.minLength);

  @override
  bool isValid(String value) {
    return value.length >= minLength;
  }
}
