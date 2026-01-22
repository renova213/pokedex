import 'package:flutter/material.dart';
import 'package:pokedex_app/src/bootstrap/app_bootstrap.dart';
import 'package:pokedex_app/src/pokedex_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap();

  runApp(const PokedexApp());
}
