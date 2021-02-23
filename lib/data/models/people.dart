// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:movie_db/core/extensions.dart';

People peopleFromJson(String str) => People.fromJson(json.decode(str));

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
        birthday:
            json['birthday'] == null ? null : DateTime.parse(json['birthday']),
        knownForDepartment: json['known_for_department'],
        deathday: json['deathday'],
        id: json['id'],
        name: json['name'],
        alsoKnownAs: json['also_known_as'] == null
            ? null
            : List<String>.from((json['also_known_as']).map((dynamic x) => x)),
        gender: json['gender'],
        biography: json['biography'],
        popularity: json['popularity'],
        placeOfBirth: json['place_of_birth'],
        profilePath: json['profile_path'],
        adult: json['adult'],
        imdbId: json['imdb_id'],
        homepage: json['homepage'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'birthday': birthday?.paddedString,
        'known_for_department': knownForDepartment,
        'deathday': deathday,
        'id': id,
        'name': name,
        'also_known_as': alsoKnownAs == null
            ? null
            : List<dynamic>.from(alsoKnownAs.map((dynamic x) => x)),
        'gender': gender,
        'biography': biography,
        'popularity': popularity,
        'place_of_birth': placeOfBirth,
        'profile_path': profilePath,
        'adult': adult,
        'imdb_id': imdbId,
        'homepage': homepage,
      };
}
