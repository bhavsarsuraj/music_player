import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:music_player/app/routes/app_pages.dart';

class AppController {
  final _auth = FirebaseAuth.instance;
  User? get user => _auth.currentUser;

  Future<void> checkAuthStatus() async {
    if (user == null) {
      Get.offAllNamed(Routes.LOGIN_PAGE);
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
