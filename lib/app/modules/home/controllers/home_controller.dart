import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:music_player/app/controllers/app_controller.dart';
import 'package:music_player/app/data/models/song.dart';
import 'package:music_player/app/data/repositories/songs_repository.dart';
import 'package:music_player/app/routes/app_pages.dart';
import 'package:music_player/app/utils/constants/enums.dart';

class HomeController extends GetxController {
  final _songsState = PaginatedWidgetState.initial.obs;
  PaginatedWidgetState get songsState => this._songsState.value;
  set songsState(PaginatedWidgetState value) => this._songsState.value = value;

  final appController = Get.find<AppController>();

  final songs = List<Song>.empty().obs;

  final _hasMoreSongs = true.obs;
  bool get hasMoreSongs => _hasMoreSongs.value;
  set hasMoreSongs(bool value) => this._hasMoreSongs.value = value;

  final perPage = 15;

  DocumentSnapshot<Map<String, dynamic>>? lastDoc;

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

  Future<void> fetchSongs() async {
    try {
      if (songsState == PaginatedWidgetState.loading ||
          songsState == PaginatedWidgetState.paginationLoading) return;
      songsState = lastDoc != null
          ? PaginatedWidgetState.paginationLoading
          : PaginatedWidgetState.loading;
      final songsResponse = await SongsRepository.fetchSongs(
        startAfterDoc: lastDoc,
        perPage: perPage,
      );
      lastDoc = songsResponse.$2;
      if (songsResponse.$1.isEmpty || songsResponse.$1.length < perPage) {
        hasMoreSongs = false;
      } else {
        hasMoreSongs = true;
      }
      songs.addAll(songsResponse.$1);
      songsState = PaginatedWidgetState.success;
    } catch (e) {
      songsState = lastDoc != null
          ? PaginatedWidgetState.paginationError
          : PaginatedWidgetState.error;
    }
  }

  Song? nextSong(Song currentSong) {
    final index = songs.indexWhere((song) => song.id == currentSong.id);
    if (index == -1) return null;
    if (index + 1 < songs.length) return songs[index + 1];
    return null;
  }

  Song? previousSong(Song currentSong) {
    final index = songs.indexWhere((song) => song.id == currentSong.id);
    if (index == -1) return null;
    if (index - 1 >= 0) return songs[index - 1];
    return null;
  }

  bool get isLoading {
    return (songsState == PaginatedWidgetState.paginationLoading) ||
        (songsState == PaginatedWidgetState.loading);
  }

  Future<void> onRefresh() async {
    _resetPagination();
    await fetchSongs();
  }

  void _resetPagination() {
    songsState = PaginatedWidgetState.initial;
    songs.clear();
    hasMoreSongs = true;
    lastDoc = null;
  }
}
