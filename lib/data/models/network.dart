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

  factory Network.fromRawJson(String str) => Network.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        headquarters: json['headquarters'],
        homepage: json['homepage'],
        id: json['id'],
        logoPath: json['logo_path'],
        name: json['name'],
        originCountry: json['origin_country'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'headquarters': headquarters,
        'homepage': homepage,
        'id': id,
        'logo_path': logoPath,
        'name': name,
        'origin_country': originCountry,
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
        name: json['name'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'type': type,
      };
}
