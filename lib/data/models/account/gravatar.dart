import 'dart:convert';

class Gravatar {
  String hash;

  Gravatar({
    this.hash,
  });

  Map<String, dynamic> toMap() {
    return {
      'hash': hash,
    };
  }

  factory Gravatar.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Gravatar(
      hash: map['hash'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Gravatar.fromJson(String source) =>
      Gravatar.fromMap(json.decode(source));
}
