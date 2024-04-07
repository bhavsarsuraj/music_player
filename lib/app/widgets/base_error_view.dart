import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/utils/constants/images.dart';
import 'package:music_player/app/widgets/primary_button.dart';

class BaseErrorView extends StatelessWidget {
  final VoidCallback onTryAgain;
  const BaseErrorView({
    Key? key,
    required this.onTryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.errorIllustration, height: 200),
            SizedBox(height: 36),
            Text(
              'Oops! Something went wrong.',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            SizedBox(
              width: Get.width * 0.4,
              child: PrimaryButton(text: 'Try Again', onTap: onTryAgain),
            ),
          ],
        ),
      ),
    );
  }
}
