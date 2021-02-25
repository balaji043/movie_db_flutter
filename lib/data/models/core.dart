// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:equatable/equatable.dart';

class PaginatedResponse<T> {
  int page;
  List<T> results;
  int totalPages;
  int totalResults;

  PaginatedResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    if (json['results'] != null) {
      final List<dynamic> resultList = json['results'];
      results = resultList
          .map(
            (dynamic v) => fromJson(
              v,
            ),
          )
          .toList();
    }
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function() toJsonModel) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results
          .map(
            (dynamic v) => toJsonModel(),
          )
          .toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class CreatedBy {
  int id;
  String creditId;
  String name;
  int gender;
  String profilePath;

  CreatedBy({this.id, this.creditId, this.name, this.gender, this.profilePath});

  CreatedBy.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    creditId = json['credit_id'];
    name = json['name'];
    gender = json['gender'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['credit_id'] = creditId;
    data['name'] = name;
    data['gender'] = gender;
    data['profile_path'] = profilePath;
    return data;
  }
}

class ProductionCompany {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  ProductionCompany.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['logo_path'] = logoPath;
    data['name'] = name;
    data['origin_country'] = originCountry;
    return data;
  }
}

class ProductionCountry {
  String iso31661;
  String name;

  ProductionCountry({this.iso31661, this.name});

  ProductionCountry.fromMap(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    return data;
  }
}

class Genre extends Equatable {
  final int id;
  final String name;
  const Genre({
    this.id,
    this.name,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
      };

  factory Genre.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return Genre(
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object> get props => <Object>[id, name];
}
