import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/widgets/primary_button.dart';
import 'package:music_player/app/widgets/text_field_with_title.dart';
import '../controllers/signup_page_controller.dart';

class SignupPageView extends GetView<SignupPageController> {
  const SignupPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          children: [
            Text(
              'Create new account',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30),
            TextFieldWithTitle(
              title: 'Email Address',
              controller: controller.emailController,
              hint: 'Enter your email address',
              onChanged: controller.onChangeEmail,
            ),
            const SizedBox(height: 24),
            TextFieldWithTitle(
              title: 'Password',
              controller: controller.passwordController,
              hint: 'Enter password',
              onChanged: controller.onChangePassword,
            ),
            const SizedBox(height: 24),
            TextFieldWithTitle(
              title: 'Confirm Password',
              controller: controller.confirmPasswordController,
              hint: 'Enter password again',
              onChanged: controller.onChangeConfirmPassword,
            ),
            const SizedBox(height: 24),
            Obx(
              () => PrimaryButton(
                text: 'Create Account',
                onTap:
                    controller.enableSignup ? controller.createAccount : null,
              ),
            ),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: 'Log in',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.yellow
                            : Colors.green),
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.login,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
