class ToastTitles {
  ToastTitles._();
  static const success = 'Success';
  static const error = 'Error';
  static const warning = 'Warning';
  static const info = 'Info';
}

class FirebaseErrorCodes {
  FirebaseErrorCodes._();

  static const String userNotFound = 'user-not-found';
  static const String invalidCredential = 'invalid-credential';
  static const String wrongPassword = 'wrong-password';
  static const String weakPassword = 'weak-password';
  static const String emailAlreadyInUse = 'email-already-in-use';
}

class ErrorMessages {
  ErrorMessages._();

  static const somethingWentWrong = 'Something went wrong';

  static const String userNotFound = 'No user found for that email';
  static const String invalidCredential =
      'Either email or password is incorrect';
  static const String wrongPassword = 'Either email or password is incorrect';
  static const String weakPassword = 'The password provided is too weak';
  static const String emailAlreadyInUse =
      'The account already exists for that email';
  static const String passwordsDoNotMatch =
      'Oops! Looks like your passwords don\'t match. Please try again';
}
