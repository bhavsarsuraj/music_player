import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:music_player/app/data/models/user_model.dart';
import 'package:music_player/app/data/repositories/user_repository.dart';
import 'package:music_player/app/routes/app_pages.dart';

class AppController {
  final _auth = FirebaseAuth.instance;
  User? get firebaseUser => _auth.currentUser;

  final _userModel = Rx<UserModel?>(null);
  UserModel? get userModel => this._userModel.value;
  set userModel(UserModel? value) => this._userModel.value = value;

  Future<void> checkAuthStatus() async {
    if (firebaseUser == null) {
      Get.offAllNamed(Routes.LOGIN_PAGE);
    } else {
      await refreshUser();
      Get.offAllNamed(Routes.HOME);
    }
  }

  Future<void> refreshUser() async {
    try {
      final userReponse = await UserRepository.getCurrentUser();
      if (userReponse != null) {
        userModel = userReponse;
      } else {
        Get.offAllNamed(Routes.LOGIN_PAGE);
      }
    } catch (e) {
      Get.offAllNamed(Routes.LOGIN_PAGE);
    }
  }
}
