import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/controllers/app_controller.dart';
import 'package:music_player/app/routes/app_pages.dart';
import 'package:music_player/app/utils/constants/validators.dart';

class LoginPageController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _email = ''.obs;
  String get email => this._email.value;
  set email(String value) => this._email.value = value;

  final _password = ''.obs;
  String get password => this._password.value;
  set password(String value) => this._password.value = value;

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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.find<AppController>().checkAuthStatus();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'invalid-credential') {
        print('Either email or password is incorrect');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print('Something went wrong');
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
}
