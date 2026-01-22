class AppAssets {
  static const String pkg = 'config';

  static const images = _AppImages();
  static const lotties = _AppLottie();
  static const icons = _AppIcons();
  static const fonts = _AppFont();
}

class _AppImages {
  const _AppImages();
  final String _path = 'assets/images';

  String get pokedexHeader => '$_path/pokedex_header.png';
  String get pokeball => '$_path/pokeball.png';
  String get pikachuShadow => '$_path/pikachu_shadow.png';
}

class _AppLottie {
  const _AppLottie();
  final String _path = 'assets/lottie';

  String get pokeBallLoading => '$_path/pokeball_loading.json';
  String get emptyData => '$_path/empty_data.json';
}

class _AppIcons {
  const _AppIcons();
  final String _path = 'assets/icons';

  String get icSearchRead => '$_path/ic_search_red.png';
  String get icWeight => '$_path/ic_weight.png';
  String get icHeight => '$_path/ic_height.png';
}

class _AppFont {
  const _AppFont();

  String get poppins => 'Poppins';
}
