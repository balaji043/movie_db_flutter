import 'dart:convert';

class AppConfiguration {
  Images images;
  List<String> changeKeys;

  AppConfiguration({
    this.images,
    this.changeKeys,
  });

  AppConfiguration.fromJson(Map<String, dynamic> json) {
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    changeKeys = json['change_keys'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    data['change_keys'] = this.changeKeys;
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
    baseUrl = json['base_url'];
    secureBaseUrl = json['secure_base_url'];
    backdropSizes = json['backdrop_sizes'].cast<String>();
    logoSizes = json['logo_sizes'].cast<String>();
    posterSizes = json['poster_sizes'].cast<String>();
    profileSizes = json['profile_sizes'].cast<String>();
    stillSizes = json['still_sizes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_url'] = this.baseUrl;
    data['secure_base_url'] = this.secureBaseUrl;
    data['backdrop_sizes'] = this.backdropSizes;
    data['logo_sizes'] = this.logoSizes;
    data['poster_sizes'] = this.posterSizes;
    data['profile_sizes'] = this.profileSizes;
    data['still_sizes'] = this.stillSizes;
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

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        iso31661: json["iso_3166_1"] == null ? null : json["iso_3166_1"],
        englishName: json["english_name"] == null ? null : json["english_name"],
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661 == null ? null : iso31661,
        "english_name": englishName == null ? null : englishName,
      };
}

class Job {
  Job({
    this.department,
    this.jobs,
  });

  final String department;
  final List<String> jobs;

  factory Job.fromRawJson(String str) => Job.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        department: json["department"] == null ? null : json["department"],
        jobs: json["jobs"] == null
            ? null
            : List<String>.from(json["jobs"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "department": department == null ? null : department,
        "jobs": jobs == null ? null : List<dynamic>.from(jobs.map((x) => x)),
      };
}

class Language {
  String englishName;
  String iso6391;
  String name;

  Language({this.englishName, this.iso6391, this.name});

  Language.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['english_name'] = this.englishName;
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
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
      TimeZones.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimeZones.fromJson(Map<String, dynamic> json) => TimeZones(
        iso31661: json["iso_3166_1"] == null ? null : json["iso_3166_1"],
        zones: json["zones"] == null
            ? null
            : List<String>.from(json["zones"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661 == null ? null : iso31661,
        "zones": zones == null ? null : List<dynamic>.from(zones.map((x) => x)),
      };
}
