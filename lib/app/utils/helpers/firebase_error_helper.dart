import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_player/app/utils/constants/strings.dart';
import 'package:music_player/app/utils/helpers/toast_helper.dart';

class FirebaseErrorHelper {
  FirebaseErrorHelper._();

  static void handleError(FirebaseAuthException e) {
    switch (e.code) {
      case FirebaseErrorCodes.emailAlreadyInUse:
        ToastHelper.showError(message: ErrorMessages.emailAlreadyInUse);
        return;
      case FirebaseErrorCodes.invalidCredential:
        ToastHelper.showError(message: ErrorMessages.invalidCredential);
        return;
      case FirebaseErrorCodes.userNotFound:
        ToastHelper.showError(message: ErrorMessages.userNotFound);
        return;
      case FirebaseErrorCodes.weakPassword:
        ToastHelper.showError(message: ErrorMessages.weakPassword);
        return;
      case FirebaseErrorCodes.wrongPassword:
        ToastHelper.showError(message: ErrorMessages.wrongPassword);
        return;
    }
    ToastHelper.showError(message: ErrorMessages.somethingWentWrong);
  }
}
