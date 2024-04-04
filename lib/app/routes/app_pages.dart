import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search_song_page/bindings/search_song_page_binding.dart';
import '../modules/search_song_page/views/search_song_page_view.dart';
import '../modules/song_details_page/bindings/song_details_page_binding.dart';
import '../modules/song_details_page/views/song_details_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SONG_DETAILS_PAGE,
      page: () => const SongDetailsPageView(),
      binding: SongDetailsPageBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_SONG_PAGE,
      page: () => const SearchSongPageView(),
      binding: SearchSongPageBinding(),
    ),
  ];
}
