import 'package:movie_db/lib.dart';

class Account {
  Account({
    this.avatar,
    this.id,
    this.iso6391,
    this.iso31661,
    this.name,
    this.includeAdult,
    this.username,
  });

  Avatar avatar;
  int id;
  String iso6391;
  String iso31661;
  String name;
  bool includeAdult;
  String username;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        avatar: Avatar.fromJson(json["avatar"]),
        id: json["id"],
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        includeAdult: json["include_adult"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar.toJson(),
        "id": id,
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "include_adult": includeAdult,
        "username": username,
      };
}
