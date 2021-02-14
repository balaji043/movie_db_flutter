// To parse this JSON data, do
//
//     final network = networkFromJson(jsonString);

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

  factory Network.fromRawJson(String str) => Network.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        headquarters:
            json["headquarters"] == null ? null : json["headquarters"],
        homepage: json["homepage"] == null ? null : json["homepage"],
        id: json["id"] == null ? null : json["id"],
        logoPath: json["logo_path"] == null ? null : json["logo_path"],
        name: json["name"] == null ? null : json["name"],
        originCountry:
            json["origin_country"] == null ? null : json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "headquarters": headquarters == null ? null : headquarters,
        "homepage": homepage == null ? null : homepage,
        "id": id == null ? null : id,
        "logo_path": logoPath == null ? null : logoPath,
        "name": name == null ? null : name,
        "origin_country": originCountry == null ? null : originCountry,
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
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "type": type == null ? null : type,
      };
}
