import 'package:email_validator/email_validator.dart';

class Validator {
  ///
  /// Validate the [password] field
  static String password(String field, String value) {
    final RegExp _numbers = RegExp(r"[0-9]");
    final RegExp _lowercase = RegExp(r"[a-z]");
    final RegExp _uppercase = RegExp(r"[A-Z]");

    if (value.length < 6)
      return 'The $field must contain at least six (6) characters';
    else if (!_numbers.hasMatch(value))
      return 'The $field must contain at least one number (0-9)';
    else if (!_lowercase.hasMatch(value))
      return 'The $field must contain at least one lowercase letter (a-z)';
    else if (!_uppercase.hasMatch(value))
      return 'The $field must contain at least one uppercase letter (A-Z)';

    return _empty(field, value);
  }

  ///
  /// Validate an empty field
  static String _empty(String field, String value) =>
      (value == null || value.isEmpty || value.trim().isEmpty)
          ? 'The $field cannot be empty'
          : null;

  ///
  /// Validate the [email] field
  static String email(String field, String value) {
    if (!EmailValidator.validate(value)) return 'The $field has invalid format';
    return _empty(field, value);
  }
}

class RegisterValidator extends Validator {
  ///
  /// Validate the [pseudo] field
  static String pseudo(String field, String value) {
    if (value.length < 3)
      return 'The $field must have at least three (3) characters';
    else if (value.length > 12)
      return 'The $field must not exceed twelve (12) characters';
    return Validator._empty(field, value);
  }

  /// Validate the confirmation [password] field
  static String confPassword(List<String> fields, List<String> values) {
    return (values[0] != values[1])
        ? "${fields[0]} and ${fields[1]} doesn't match"
        : Validator._empty(fields[1], values[1]);
  }
}
