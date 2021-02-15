// To parse this JSON data, do
//
//     final network = networkFromJson(jsonString);

// Dart imports:
import 'dart:convert';

class Network {
  Network({
    this.headquarters,
    this.homepage,
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  String headquarters;
  String homepage;
  int id;
  String logoPath;
  String name;
  String originCountry;

  factory Network.fromRawJson(String str) =>
      Network.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        headquarters: json["headquarters"] as String,
        homepage: json["homepage"] as String,
        id: json["id"] as int,
        logoPath: json["logo_path"] as String,
        name: json["name"] as String,
        originCountry: json["origin_country"] as String,
      );

  Map<String, dynamic> toJson() => {
        "headquarters": headquarters,
        "homepage": homepage,
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}

class AlternativeNetworkName {
  AlternativeNetworkName({
    this.name,
    this.type,
  });

  String name;
  String type;

  factory AlternativeNetworkName.fromJson(Map<String, dynamic> json) =>
      AlternativeNetworkName(
        name: json["name"] as String,
        type: json["type"] as String,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
      };
}
