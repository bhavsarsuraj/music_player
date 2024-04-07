import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loader {
  static var _isLoaderShowing = false;

  static void show() {
    if (!_isLoaderShowing) {
      Get.dialog(
        PopScope(
          canPop: false,
          child: Center(
            child: CupertinoActivityIndicator(
              color: Theme.of(Get.context!).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              radius: 16,
            ),
          ),
        ),
        barrierDismissible: false,
      );
      _isLoaderShowing = true;
    } else {
      hide();
      show();
    }
  }

  static void hide() {
    if (_isLoaderShowing) {
      Get.back();
      _isLoaderShowing = false;
    }
  }
}

class LoaderWidget extends StatelessWidget {
  final double size;
  const LoaderWidget({Key? key, this.size = 36}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: Theme.of(Get.context!).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
        radius: 16,
      ),
    );
  }
}
