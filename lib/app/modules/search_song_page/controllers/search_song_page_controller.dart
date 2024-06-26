import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/data/models/song.dart';
import 'package:music_player/app/data/repositories/songs_repository.dart';
import 'package:music_player/app/utils/constants/enums.dart';
import 'package:music_player/app/utils/helpers/song_helper.dart';

class SearchSongPageController extends GetxController {
  final searchController = TextEditingController();

  final _query = ''.obs;
  String get query => this._query.value;
  set query(String value) => this._query.value = value;

  final _searchState = WidgetState.initial.obs;
  WidgetState get searchState => this._searchState.value;
  set searchState(WidgetState value) => this._searchState.value = value;

  final filteredSongs = [].obs;

  final songsRepository = SongsRepository(FirebaseFirestore.instance);

  @override
  void onInit() {
    _configure();
    super.onInit();
  }

  void _configure() {
    _setupDebounce();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _setupDebounce() {
    debounce(
      _query,
      (_) => getSearchResults(),
      time: const Duration(milliseconds: 500),
    );
  }

  void onChangeQuery(String value) {
    query = value;
  }

  void getSearchResults() async {
    try {
      if (query.trim().isEmpty) {
        searchState = WidgetState.initial;
        filteredSongs.clear();
        return;
      }
      searchState = WidgetState.loading;
      final searchedSongs = await songsRepository.getSongsByQuery(query);
      filteredSongs.assignAll(searchedSongs);
      searchState = WidgetState.success;
    } catch (e) {
      searchState = WidgetState.error;
    }
  }

  bool isFavourite(Song song) {
    return SongHelper.isFavourite(song.id ?? '');
  }

  void onPressedFavourite(Song song) {
    if (isFavourite(song)) {
      SongHelper.removeFromFavourite(song.id ?? ' ');
    } else {
      SongHelper.markFavourite(song.id ?? ' ');
    }
  }
}
