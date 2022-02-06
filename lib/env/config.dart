// ignore_for_file: prefer_constructors_over_static_methods

class Config {
  Config({this.apiBaseUrl, this.flavorName});

  final String? flavorName;
  final String? apiBaseUrl;

  static Config? _instance;

  static Future<Config> getInstance(
      {String? flavorName, String? apiBaseUrl}) async {
    if (_instance == null) {
      _instance = Config(flavorName: flavorName, apiBaseUrl: apiBaseUrl);
      return _instance!;
    }
    return _instance!;
  }
}
