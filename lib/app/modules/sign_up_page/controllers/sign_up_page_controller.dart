import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/data/models/user_model.dart';
import 'package:music_player/app/data/repositories/user_repository.dart';
import 'package:music_player/app/routes/app_pages.dart';
import 'package:music_player/app/utils/constants/strings.dart';
import 'package:music_player/app/utils/constants/validators.dart';
import 'package:music_player/app/utils/helpers/firebase_error_helper.dart';
import 'package:music_player/app/utils/helpers/toast_helper.dart';
import 'package:music_player/app/widgets/loader.dart';

class SignUpPageController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _email = ''.obs;
  String get email => this._email.value.trim();
  set email(String value) => this._email.value = value.trim();

  final _password = ''.obs;
  String get password => this._password.value.trim();
  set password(String value) => this._password.value = value.trim();

  final _confirmPassword = ''.obs;
  String get confirmPassword => this._confirmPassword.value.trim();
  set confirmPassword(String value) =>
      this._confirmPassword.value = value.trim();

  final _showPassword = false.obs;
  bool get showPassword => this._showPassword.value;
  set showPassword(bool value) => this._showPassword.value = value;

  final _showConfirmPassword = false.obs;
  bool get showConfirmPassword => this._showConfirmPassword.value;
  set showConfirmPassword(bool value) =>
      this._showConfirmPassword.value = value;

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

  void signup() async {
    try {
      if (!passwordsMatching) {
        ToastHelper.showError(message: 'Passwords do not match');
        return;
      }
      Loader.show();
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userModel = UserModel(id: user.user?.uid);
      await userRepository.setCurrentUser(userModel);
      Loader.hide();
      ToastHelper.showSuccess(message: 'Account created successfully');
      Get.offAllNamed(Routes.SIGNIN_PAGE);
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

  void onChangeConfirmPassword(String? value) {
    if (value == null) return;
    confirmPassword = value;
  }

  bool get passwordsMatching {
    return Validators.isValidPassword(password) &&
        Validators.isValidPassword(confirmPassword) &&
        password == confirmPassword;
  }

  bool get enableSignup {
    return Validators.isValidEmail(email) &&
        Validators.isValidPassword(password) &&
        Validators.isValidPassword(confirmPassword);
  }

  void updatePasswordVisibility() {
    showPassword = !showPassword;
  }

  void updateConfirmPasswordVisibility() {
    showConfirmPassword = !showConfirmPassword;
  }

  void login() {
    Get.back();
  }
}
