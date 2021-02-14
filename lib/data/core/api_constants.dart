class ApiConstants {
  ApiConstants._();

  static const String TMDBBaseUrlV3 = "https://api.themoviedb.org/3";
  static const String apiKey = String.fromEnvironment("api_key");
  static const params = {
    'api_key': apiKey,
    'language': 'en-US',
    'page': 1,
  };
}
