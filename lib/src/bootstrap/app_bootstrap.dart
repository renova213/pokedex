import 'package:config/config.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_app/src/di/app_injection.dart';

Future<void> bootstrap() async {
  await AppConfig.loadEnv(EnvType.dev);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await injection();
}
