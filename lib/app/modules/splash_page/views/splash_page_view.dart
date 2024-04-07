import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/widgets/base_scaffold.dart';
import '../controllers/splash_page_controller.dart';

class SplashPageView extends GetView<SplashPageController> {
  const SplashPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(body: Container());
  }
}
