// Dart imports:
import 'dart:convert';

People peopleFromJson(String str) =>
    People.fromJson(json.decode(str) as Map<String, dynamic>);

String peopleToJson(People data) => json.encode(data.toJson());

class People {
  People({
    this.birthday,
    this.knownForDepartment,
    this.deathday,
    this.id,
    this.name,
    this.alsoKnownAs,
    this.gender,
    this.biography,
    this.popularity,
    this.placeOfBirth,
    this.profilePath,
    this.adult,
    this.imdbId,
    this.homepage,
  });

  DateTime birthday;
  String knownForDepartment;
  dynamic deathday;
  int id;
  String name;
  List<String> alsoKnownAs;
  int gender;
  String biography;
  double popularity;
  String placeOfBirth;
  String profilePath;
  bool adult;
  String imdbId;
  dynamic homepage;

  factory People.fromJson(Map<String, dynamic> json) => People(
        birthday: json["birthday"] == null
            ? null
            : DateTime.parse(json["birthday"] as String),
        knownForDepartment: json["known_for_department"] as String,
        deathday: json["deathday"],
        id: json["id"] as int,
        name: json["name"] as String,
        alsoKnownAs: json["also_known_as"] == null
            ? null
            : List<String>.from((json["also_known_as"] as List).map((x) => x)),
        gender: json["gender"] as int,
        biography: json["biography"] as String,
        popularity:
            json["popularity"] == null ? null : json["popularity"] as double,
        placeOfBirth: json["place_of_birth"] as String,
        profilePath: json["profile_path"] as String,
        adult: json["adult"] as bool,
        imdbId: json["imdb_id"] as String,
        homepage: json["homepage"],
      );

  Map<String, dynamic> toJson() => {
        "birthday": birthday == null
            ? null
            : "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "known_for_department": knownForDepartment,
        "deathday": deathday,
        "id": id,
        "name": name,
        "also_known_as": alsoKnownAs == null
            ? null
            : List<dynamic>.from(alsoKnownAs.map((x) => x)),
        "gender": gender,
        "biography": biography,
        "popularity": popularity,
        "place_of_birth": placeOfBirth,
        "profile_path": profilePath,
        "adult": adult,
        "imdb_id": imdbId,
        "homepage": homepage,
      };
}
