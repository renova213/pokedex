import 'package:config/src/env_type.dart';
import 'package:dependencies/dependencies.dart';

class AppConfig {
  AppConfig._();

  static String get flavor => dotenv.get("FLAVOR", fallback: "unknown");
  static String get appName => dotenv.get("APP_NAME", fallback: "unknown");
  static String get mainBaseUrl => dotenv.get("BASE_URL");

  static Future<void> loadEnv(EnvType type) async {
    switch (type) {
      case EnvType.prod:
        dotenv.load(fileName: "packages/config/.env_prod");
        break;
      default:
        dotenv.load(fileName: "packages/config/.env_dev");
    }
  }
}
