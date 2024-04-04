import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/song_details_page_controller.dart';

class SongDetailsPageView extends GetView<SongDetailsPageController> {
  const SongDetailsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SongDetailsPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SongDetailsPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
