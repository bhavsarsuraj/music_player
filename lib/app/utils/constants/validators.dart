class Validators {
  static bool isValidEmail(String email) => hasMatch(
        email,
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      );

  static bool isValidPassword(String password) {
    return password.trim().isNotEmpty && password.length >= 8;
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }
}

class ValidationMessages {
  static const String email = 'Name must be at least 3 characters long';
  static const String mobile = 'Please enter a valid mobile number.';
}
