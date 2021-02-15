// Dart imports:
import 'dart:convert';

class AppConfiguration {
  Images images;
  List<String> changeKeys;

  AppConfiguration({
    this.images,
    this.changeKeys,
  });

  AppConfiguration.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null
        ? Images.fromJson(
            json['images'] as Map<String, dynamic>,
          )
        : null;
    changeKeys = json['change_keys'].cast<String>() as List<String>;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (images != null) {
      data['images'] = images.toJson();
    }
    data['change_keys'] = changeKeys;
    return data;
  }
}

class Images {
  String baseUrl;
  String secureBaseUrl;
  List<String> backdropSizes;
  List<String> logoSizes;
  List<String> posterSizes;
  List<String> profileSizes;
  List<String> stillSizes;

  Images({
    this.baseUrl,
    this.secureBaseUrl,
    this.backdropSizes,
    this.logoSizes,
    this.posterSizes,
    this.profileSizes,
    this.stillSizes,
  });

  Images.fromJson(Map<String, dynamic> json) {
    baseUrl = json['base_url'] as String;
    secureBaseUrl = json['secure_base_url'] as String;
    backdropSizes = (json['backdrop_sizes'] as List).cast<String>();
    logoSizes = (json['logo_sizes'] as List).cast<String>();
    posterSizes = (json['poster_sizes'] as List).cast<String>();
    profileSizes = (json['profile_sizes'] as List).cast<String>();
    stillSizes = (json['still_sizes'] as List).cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_url'] = baseUrl;
    data['secure_base_url'] = secureBaseUrl;
    data['backdrop_sizes'] = backdropSizes;
    data['logo_sizes'] = logoSizes;
    data['poster_sizes'] = posterSizes;
    data['profile_sizes'] = profileSizes;
    data['still_sizes'] = stillSizes;
    return data;
  }
}

class Country {
  Country({
    this.iso31661,
    this.englishName,
  });

  final String iso31661;
  final String englishName;

  factory Country.fromRawJson(String str) => Country.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        iso31661: json["iso_3166_1"] as String,
        englishName: json['english_name'] as String,
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "english_name": englishName,
      };
}

class Job {
  Job({
    this.department,
    this.jobs,
  });

  final String department;
  final List<String> jobs;

  factory Job.fromRawJson(String str) => Job.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        department: json["department"] as String,
        jobs: json["jobs"] == null
            ? null
            : List<String>.from(
                (json["jobs"] as List).map((x) => x),
              ),
      );

  Map<String, dynamic> toJson() => {
        "department": department,
        "jobs": jobs == null ? null : List<dynamic>.from(jobs.map((x) => x)),
      };
}

class Language {
  String englishName;
  String iso6391;
  String name;

  Language({this.englishName, this.iso6391, this.name});

  Language.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'] as String;
    iso6391 = json['iso_639_1'] as String;
    name = json['name'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['english_name'] = englishName;
    data['iso_639_1'] = iso6391;
    data['name'] = name;
    return data;
  }
}

class TimeZones {
  TimeZones({
    this.iso31661,
    this.zones,
  });

  final String iso31661;
  final List<String> zones;

  factory TimeZones.fromRawJson(String str) =>
      TimeZones.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory TimeZones.fromJson(Map<String, dynamic> json) => TimeZones(
        iso31661: json["iso_3166_1"] as String,
        zones: json["zones"] == null
            ? null
            : List<String>.from((json["zones"] as List).map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "zones": zones == null ? null : List<dynamic>.from(zones.map((x) => x)),
      };
}
