import 'package:validators/validators.dart' show isNumeric;

class Validators {
  Validators._();

  static String? isNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    } else {
      return null;
    }
  }

  static String? isValidPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    } else if (!validatePasswordStructure(value)) {
      return 'Password must be at least 8 characters long and contain at least one upper case letter, one lowercase letter, one numeric value.';
    } else {
      return null;
    }
  }

  static String? isEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    } else if (validateEmail(value)) {
      return null;
    } else {
      return 'Invalid email';
    }
  }

  static bool validatePasswordStructure(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateEmail(String value) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  static String? isLength(String? value, int length,
      {String fieldName = "Field"}) {
    if (value == null || value.isEmpty) {
      return '$fieldName cannot be empty';
    } else if (value.length != length) {
      return "Must be of length $length";
    } else {
      return null;
    }
  }

  static String? isValidNumberAndLength(String? value,
      {int length = 11, String fieldName = "Field"}) {
    if (value == null || value.isEmpty) {
      return '$fieldName cannot be empty';
    } else if (!isNumeric(value)) {
      return "Invalid Number";
    } else if (value.length != length) {
      return "Must be of length $length";
    } else {
      return null;
    }
  }

  static String? isValidNumber(String? value, {String fieldName = "Field"}) {
    if (value == null || value.isEmpty) {
      return '$fieldName cannot be empty';
    } else if (!isNumeric(value)) {
      return "Invalid Number";
    } else {
      return null;
    }
  }

  static String? isValidSelection<T>(T? value, List<T> items,
      {String fieldName = "Field"}) {
    if (value == null) {
      return '$fieldName cannot be empty';
    } else if (value is String && value.isEmpty) {
      return '$fieldName cannot be empty';
    } else if (!items.contains(value)) {
      return "Select a valid value";
    }
    return null;
  }
}
