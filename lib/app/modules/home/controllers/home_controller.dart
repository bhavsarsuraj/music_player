import 'package:get/get.dart';
import 'package:music_player/app/controllers/app_controller.dart';
import 'package:music_player/app/data/models/song.dart';
import 'package:music_player/app/data/repositories/songs_repository.dart';
import 'package:music_player/app/routes/app_pages.dart';
import 'package:music_player/app/utils/constants/enums.dart';

class HomeController extends GetxController {
  final _songsState = WidgetState.initial.obs;
  WidgetState get songsState => this._songsState.value;
  set songsState(WidgetState value) => this._songsState.value = value;

  final appController = Get.find<AppController>();

  final songs = List<Song>.empty().obs;

  @override
  void onInit() {
    fetchSongs();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void search() {
    Get.toNamed(Routes.SEARCH_SONG_PAGE);
  }

  void fetchSongs() async {
    try {
      songsState = WidgetState.loading;
      final songsResponse = await SongsRepository.fetchSongs();
      songs.assignAll(songsResponse);
      songsState = WidgetState.success;
    } catch (e) {
      songsState = WidgetState.error;
    }
  }

  void markSongFavourite(String songId) async {
    // try {
    //   await UserRepository.markSongFavourite(songId);
    // } catch (e) {
    //   print(e);
    // }
  }

  bool isMarkedFavourite(String songId) {
    // return appController.userModel?.favouriteSongs?.contains(songId) ?? false;
    return false;
  }
}
