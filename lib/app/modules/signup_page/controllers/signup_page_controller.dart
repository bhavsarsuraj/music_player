import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/data/models/user_model.dart';
import 'package:music_player/app/data/repositories/user_repository.dart';
import 'package:music_player/app/utils/constants/validators.dart';
import 'package:music_player/app/widgets/loader.dart';

class SignupPageController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _email = ''.obs;
  String get email => this._email.value;
  set email(String value) => this._email.value = value;

  final _password = ''.obs;
  String get password => this._password.value;
  set password(String value) => this._password.value = value;

  final _confirmPassword = ''.obs;
  String get confirmPassword => this._confirmPassword.value;
  set confirmPassword(String value) => this._confirmPassword.value = value;

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

  void createAccount() async {
    try {
      Loader.show();
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userModel = UserModel(id: user.user?.uid);
      await UserRepository.setCurrentUser(userModel);
      Loader.hide();
      Get.back();
    } on FirebaseAuthException catch (e) {
      Loader.hide();
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      Loader.hide();
      print(e);
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

  bool get arePasswordsMatching {
    return Validators.isValidPassword(password) &&
        Validators.isValidPassword(confirmPassword) &&
        password == confirmPassword;
  }

  bool get enableSignup {
    return Validators.isValidEmail(email) &&
        Validators.isValidPassword(password) &&
        Validators.isValidPassword(confirmPassword);
  }

  void login() {
    Get.back();
  }
}
