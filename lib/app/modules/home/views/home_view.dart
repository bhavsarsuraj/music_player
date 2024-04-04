import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/widgets/song_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: controller.search,
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        itemBuilder: (context, index) => SongCard(),
        separatorBuilder: (context, index) => Divider(
          height: 10,
          thickness: 1,
          color: Theme.of(context).hintColor.withOpacity(0.05),
        ),
        itemCount: 20,
      ),
    );
  }
}
