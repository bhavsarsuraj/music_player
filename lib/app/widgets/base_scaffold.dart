import 'package:flutter/material.dart';
import 'package:music_player/app/widgets/base_gradient_container.dart';

class BaseScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  const BaseScaffold({super.key, this.appBar, required this.body});

  @override
  Widget build(BuildContext context) {
    return BaseGradientContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: body,
      ),
    );
  }
}
