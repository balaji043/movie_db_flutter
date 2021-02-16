/// Simple wrapper for enum with the enum as type
class EnumValues<T> {
  /// map : key = String value and T = enum equal
  Map<String, T> map;

  /// map : key = String value and T = enum equal
  Map<T, String> reverseMap;

  /// For creating an enum value with map
  EnumValues(this.map);

  /// Get
  Map<T, String> get reverse => reverseMap ??= map.map(
        (String k, T v) => MapEntry<T, String>(v, k),
      );
}
