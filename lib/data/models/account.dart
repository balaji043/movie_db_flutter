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
        avatar: Avatar.fromJson(json["avatar"] as Map<String, dynamic>),
        id: json["id"] as int,
        iso6391: json["iso_639_1"] as String,
        iso31661: json["iso_3166_1"] as String,
        name: json["name"] as String,
        includeAdult: json["include_adult"] as bool,
        username: json["username"] as String,
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

class Gravatar {
  Gravatar({
    this.hash,
  });

  String hash;

  factory Gravatar.fromJson(Map<String, dynamic> json) => Gravatar(
        hash: json["hash"] as String,
      );

  Map<String, dynamic> toJson() => {
        "hash": hash,
      };
}

class Avatar {
  Avatar({
    this.gravatar,
  });

  Gravatar gravatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        gravatar: Gravatar.fromJson(json["gravatar"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "gravatar": gravatar.toJson(),
      };
}
