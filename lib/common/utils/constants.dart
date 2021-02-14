const String api_key = String.fromEnvironment("api_key");
const String APP_TITLE = "MovieDB";
const String mainURL = "https://api.themoviedb.org/3";
const params = {
  'api_key': api_key,
  'language': 'en-US',
  'page': 1,
};
void printException(dynamic error, StackTrace stackTrace) =>
    print("Exception occured: $error stackTrace: $stackTrace");
