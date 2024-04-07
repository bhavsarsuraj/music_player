import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/utils/constants/widget_keys.dart';
import 'package:music_player/app/widgets/password_icon_button.dart';
import 'package:music_player/app/widgets/primary_button.dart';
import 'package:music_player/app/widgets/text_field_with_title.dart';
import '../controllers/sign_in_page_controller.dart';

class SignInPageView extends GetView<SignInPageController> {
  const SignInPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _Body(),
    );
  }
}

class _Body extends GetView<SignInPageController> {
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
          _SigninButton(),
          SizedBox(height: 12),
          _Signup(),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Sign In',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class _Email extends GetView<SignInPageController> {
  const _Email({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldWithTitle(
      key: WidgetKeys.signInEmail,
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

class _Password extends GetView<SignInPageController> {
  const _Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFieldWithTitle(
        key: WidgetKeys.signInPassword,
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

class _SigninButton extends GetView<SignInPageController> {
  const _SigninButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        text: 'Sign in',
        onTap: controller.enableLogin ? controller.login : null,
      ),
    );
  }
}

class _Signup extends GetView<SignInPageController> {
  const _Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account? ',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(width: 2),
        GestureDetector(
          onTap: controller.signup,
          child: Text(
            'Sign Up',
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
