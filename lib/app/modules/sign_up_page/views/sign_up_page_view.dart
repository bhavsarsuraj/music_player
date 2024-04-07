import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/utils/constants/widget_keys.dart';
import 'package:music_player/app/widgets/base_scaffold.dart';
import 'package:music_player/app/widgets/password_icon_button.dart';
import 'package:music_player/app/widgets/primary_button.dart';
import 'package:music_player/app/widgets/text_field_with_title.dart';
import '../controllers/sign_up_page_controller.dart';

class SignUpPageView extends GetView<SignUpPageController> {
  const SignUpPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: const _Body(),
    );
  }
}

class _Body extends GetView<SignUpPageController> {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 40,
          bottom: 24,
        ),
        children: const [
          _Title(),
          SizedBox(height: 30),
          _Email(),
          SizedBox(height: 24),
          _Password(),
          SizedBox(height: 24),
          _ConfirmPassword(),
          SizedBox(height: 24),
          _CreateAccount(),
          SizedBox(height: 12),
          _Login(),
        ],
      ),
    );
  }
}

class _Title extends GetView<SignUpPageController> {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Sign Up',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class _Email extends GetView<SignUpPageController> {
  const _Email({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldWithTitle(
      key: WidgetKeys.signUpEmail,
      title: 'Email Address',
      controller: controller.emailController,
      hint: 'Enter your email address',
      onChanged: controller.onChangeEmail,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      prefix: Icon(Icons.mail, size: 20),
    );
  }
}

class _Password extends GetView<SignUpPageController> {
  const _Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFieldWithTitle(
        key: WidgetKeys.signUpPassword,
        title: 'Password',
        controller: controller.passwordController,
        hint: 'Enter password',
        onChanged: controller.onChangePassword,
        prefix: Icon(Icons.lock, size: 20),
        obscureText: !controller.showPassword,
        maxLines: 1,
        suffix: PasswordIconButton(
          showPassword: controller.showPassword,
          onPressed: controller.updatePasswordVisibility,
        ),
      ),
    );
  }
}

class _ConfirmPassword extends GetView<SignUpPageController> {
  const _ConfirmPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFieldWithTitle(
        key: WidgetKeys.signUpConfirmPassword,
        title: 'Confirm Password',
        controller: controller.confirmPasswordController,
        hint: 'Enter password again',
        onChanged: controller.onChangeConfirmPassword,
        prefix: Icon(Icons.lock, size: 20),
        obscureText: !controller.showConfirmPassword,
        maxLines: 1,
        suffix: PasswordIconButton(
          showPassword: controller.showConfirmPassword,
          onPressed: controller.updateConfirmPasswordVisibility,
        ),
      ),
    );
  }
}

class _CreateAccount extends GetView<SignUpPageController> {
  const _CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        text: 'Sign up',
        onTap: controller.enableSignup ? controller.signup : null,
      ),
    );
  }
}

class _Login extends GetView<SignUpPageController> {
  const _Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(width: 2),
        GestureDetector(
          onTap: controller.login,
          child: Text(
            'Sign In',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.yellow
                    : Colors.green),
          ),
        ),
      ],
    );
  }
}
