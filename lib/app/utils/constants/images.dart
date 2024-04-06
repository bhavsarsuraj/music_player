abstract class Images {
  Images._();

  // Add all images here
  static const _base = 'assets/images/';
  static String get errorIllustration => '${_base}error_illustration.png';
  static String get shuffle => '${_base}shuffle.png';
  static String get hidePassword => '${_base}hide_password.png';
  static String get visiblePassword => '${_base}visible_password.png';
}
