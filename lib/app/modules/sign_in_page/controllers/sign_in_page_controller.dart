import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/controllers/app_controller.dart';
import 'package:music_player/app/data/models/user_model.dart';
import 'package:music_player/app/data/repositories/user_repository.dart';
import 'package:music_player/app/routes/app_pages.dart';
import 'package:music_player/app/utils/constants/strings.dart';
import 'package:music_player/app/utils/constants/validators.dart';
import 'package:music_player/app/utils/helpers/firebase_error_helper.dart';
import 'package:music_player/app/utils/helpers/toast_helper.dart';
import 'package:music_player/app/widgets/loader.dart';

class SignInPageController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _email = ''.obs;
  String get email => this._email.value.trim();
  set email(String value) => this._email.value = value.trim();

  final _password = ''.obs;
  String get password => this._password.value.trim();
  set password(String value) => this._password.value = value.trim();
  final appController = Get.find<AppController>();

  final _showPassword = false.obs;
  bool get showPassword => this._showPassword.value;
  set showPassword(bool value) => this._showPassword.value = value;

  final userRepository = UserRepository(FirebaseFirestore.instance);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void login() async {
    try {
      Loader.show();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final firebaseUser = appController.firebaseUser;
      UserModel? user = await userRepository.getUser(firebaseUser?.uid ?? '');
      if (user == null) {
        user = UserModel(id: firebaseUser?.uid);
        await userRepository.setCurrentUser(user);
      }
      appController.userModel = user;
      Loader.hide();
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      Loader.hide();
      FirebaseErrorHelper.handleError(e);
    } catch (e) {
      Loader.hide();
      ToastHelper.showError(message: ErrorMessages.somethingWentWrong);
    }
  }

  void onChangeEmail(String? value) {
    if (value == null) return;
    email = value;
  }

  void onChangePassword(String? value) {
    if (value == null) return;
    password = value;
  }

  bool get enableLogin {
    return Validators.isValidEmail(email) &&
        Validators.isValidPassword(password);
  }

  void signup() {
    Get.toNamed(Routes.SIGNUP_PAGE);
  }

  void updatePasswordVisibility() {
    showPassword = !showPassword;
  }
}
