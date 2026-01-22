import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:config/config.dart';
import 'package:pokedex/pokedex.dart';

Future<void> injection({GlobalKey<NavigatorState>? navigatorKey}) async {
  // MARK: Core
  locator.registerLazySingleton<ApiService>(
    () => ApiService(baseUrl: AppConfig.mainBaseUrl),
  );

  // MARK: Features
  await pokedexInjection();
}
