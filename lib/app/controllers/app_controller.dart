import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:music_player/app/data/models/user_model.dart';
import 'package:music_player/app/data/repositories/user_repository.dart';
import 'package:music_player/app/routes/app_pages.dart';
import 'package:music_player/app/services/audio_player_service.dart';
import 'package:music_player/app/utils/constants/strings.dart';
import 'package:music_player/app/utils/helpers/toast_helper.dart';
import 'package:music_player/app/widgets/loader.dart';

class AppController {
  final _auth = FirebaseAuth.instance;
  User? get firebaseUser => _auth.currentUser;

  final _userModel = Rx<UserModel?>(null);
  UserModel? get userModel => this._userModel.value;
  set userModel(UserModel? value) => this._userModel.value = value;

  Future<void> checkAuthStatus() async {
    if (firebaseUser == null) {
      Get.offAllNamed(Routes.SIGNIN_PAGE);
    } else {
      await refreshUser();
      Get.offAllNamed(Routes.HOME);
    }
  }

  void refreshUserModel() {
    _userModel.refresh();
  }

  Future<void> refreshUser() async {
    try {
      final userReponse = await UserRepository.getUser(firebaseUser?.uid ?? '');
      if (userReponse != null) {
        userModel = userReponse;
      } else {
        Get.offAllNamed(Routes.SIGNIN_PAGE);
      }
    } catch (e) {
      Get.offAllNamed(Routes.SIGNIN_PAGE);
    }
  }

  Future<void> signout() async {
    try {
      Loader.show();
      await _auth.signOut();
      userModel = null;
      await AudioPlayerService.clearData();
      Loader.hide();
      Get.offAllNamed(Routes.SIGNIN_PAGE);
    } catch (e) {
      Loader.hide();
      ToastHelper.showError(message: ErrorMessages.somethingWentWrong);
    }
  }
}
