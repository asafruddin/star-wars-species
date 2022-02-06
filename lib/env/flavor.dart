import 'package:movie_app/env/config.dart';

class FlavorSetting {
  FlavorSetting.development() {
    Config.getInstance(
        flavorName: 'development', apiBaseUrl: 'https://swapi.dev/api');
  }

  FlavorSetting.staging() {
    Config.getInstance(
        flavorName: 'staging', apiBaseUrl: 'https://swapi.dev/api');
  }

  FlavorSetting.production() {
    Config.getInstance(
        flavorName: 'production', apiBaseUrl: 'https://swapi.dev/api');
  }
}
