import 'package:get/get.dart';
import 'package:music_player/app/data/models/song.dart';
import 'package:music_player/app/modules/home/controllers/home_controller.dart';
import 'package:music_player/app/services/audio_player_service.dart';

class SongDetailsPageArguments {
  final Song song;
  SongDetailsPageArguments({required this.song});
}

class SongDetailsPageController extends GetxController {
  final SongDetailsPageArguments? arguments;
  SongDetailsPageController({this.arguments});

  bool _isValid = true;
  final homeController = Get.find<HomeController>();

  final _currentSong = Rx<Song?>(null);
  Song? get currentSong => this._currentSong.value;
  set currentSong(Song? value) => this._currentSong.value = value;

  final _nextSong = Rx<Song?>(null);
  Song? get nextSong => this._nextSong.value;
  set nextSong(Song? value) => this._nextSong.value = value;

  final _previousSong = Rx<Song?>(null);
  Song? get previousSong => this._previousSong.value;
  set previousSong(Song? value) => this._previousSong.value = value;

  @override
  void onInit() {
    configure();
    super.onInit();
  }

  void configure() {
    _isValid = arguments != null && arguments is SongDetailsPageArguments;
    if (!_isValid) {
      return;
    }
    configureCurrentSong(arguments!.song);
  }

  @override
  void onReady() {
    if (!_isValid) {
      Get.back();
      return;
    }
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }

  void configureCurrentSong(Song song) {
    currentSong = song;
    _setNextAndPreviousSongs();
    if (AudioPlayerService.song?.id == song.id) return;
    AudioPlayerService.playSong(currentSong!);
  }

  void _setNextAndPreviousSongs() {
    nextSong = homeController.nextSong(currentSong!);
    previousSong = homeController.previousSong(currentSong!);
  }

  void didTapNextSong() {
    if (nextSong == null) return;
    configureCurrentSong(nextSong!);
  }

  void didTapPreviousSong() {
    if (previousSong == null) return;
    configureCurrentSong(previousSong!);
  }

  void shuffle() {
    homeController.songs.shuffle();
    _setNextAndPreviousSongs();
  }
}
