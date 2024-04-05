import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/search_song_page/bindings/search_song_page_binding.dart';
import '../modules/search_song_page/views/search_song_page_view.dart';
import '../modules/signup_page/bindings/signup_page_binding.dart';
import '../modules/signup_page/views/signup_page_view.dart';
import '../modules/song_details_page/bindings/song_details_page_binding.dart';
import '../modules/song_details_page/views/song_details_page_view.dart';
import '../modules/splash_page/bindings/splash_page_binding.dart';
import '../modules/splash_page/views/splash_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_PAGE;

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
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_PAGE,
      page: () => const SignupPageView(),
      binding: SignupPageBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_PAGE,
      page: () => const SplashPageView(),
      binding: SplashPageBinding(),
    ),
  ];
}
