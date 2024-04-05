import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/widgets/primary_button.dart';
import 'package:music_player/app/widgets/text_field_with_title.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          children: [
            Text(
              'Login',
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
            Obx(
              () => PrimaryButton(
                text: 'Login',
                onTap: controller.enableLogin ? controller.login : null,
              ),
            ),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Don’t have an account? ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: 'Sign up',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.yellow
                            : Colors.green),
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.signup,
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
