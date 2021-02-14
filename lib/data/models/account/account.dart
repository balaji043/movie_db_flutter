import 'dart:convert';

import 'avatar.dart';

class Account {
  Avatar avatar;
  int id;
  String iso6391;
  String iso31661;
  String name;
  bool includeAdult;
  String username;

  Account({
    this.avatar,
    this.id,
    this.iso6391,
    this.iso31661,
    this.name,
    this.includeAdult,
    this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar?.toMap(),
      'id': id,
      'iso6391': iso6391,
      'iso31661': iso31661,
      'name': name,
      'includeAdult': includeAdult,
      'username': username,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Account(
      avatar: Avatar.fromMap(map['avatar']),
      id: map['id'],
      iso6391: map['iso6391'],
      iso31661: map['iso31661'],
      name: map['name'],
      includeAdult: map['includeAdult'],
      username: map['username'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));
}
