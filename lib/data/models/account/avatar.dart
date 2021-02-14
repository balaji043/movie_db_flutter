import 'dart:convert';

import 'gravatar.dart';

class Avatar {
  Gravatar gravatar;

  Avatar({
    this.gravatar,
  });

  Map<String, dynamic> toMap() {
    return {
      'gravatar': gravatar?.toMap(),
    };
  }

  factory Avatar.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Avatar(
      gravatar: Gravatar.fromMap(map['gravatar']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Avatar.fromJson(String source) => Avatar.fromMap(json.decode(source));
}
