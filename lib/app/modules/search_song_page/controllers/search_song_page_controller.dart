import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchSongPageController extends GetxController {
  final searchController = TextEditingController();

  final _query = ''.obs;
  String get query => this._query.value;
  set query(String value) => this._query.value = value;

  final filteredSongs = [].obs;

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
    debounce(_query, (_) => _getSearchResults());
  }

  void onChangeQuery(String value) {
    query = value;
  }

  void _getSearchResults() {}
}
