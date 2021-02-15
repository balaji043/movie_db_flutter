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
    page = json['page'] as int;
    totalPages = json['total_pages'] as int;
    totalResults = json['total_results'] as int;
    if (json['results'] != null) {
      final resultList = json['results'] as List;
      results = resultList
          .map(
            (v) => fromJson(
              v as Map<String, dynamic>,
            ),
          )
          .toList();
    }
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function() toJsonModel) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results.map((v) => toJsonModel()).toList();
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

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    creditId = json['credit_id'] as String;
    name = json['name'] as String;
    gender = json['gender'] as int;
    profilePath = json['profile_path'] as String;
  }

  Map<String, dynamic> toJson() {
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

  ProductionCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    logoPath = json['logo_path'] as String;
    name = json['name'] as String;
    originCountry = json['origin_country'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['logo_path'] = logoPath;
    data['name'] = name;
    data['origin_country'] = originCountry;
    return data;
  }
}

class ProductionCountries {
  String iso31661;
  String name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'] as String;
    name = json['name'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    return data;
  }
}

class Genre {
  int id;
  String name;

  Genre({
    this.id,
    this.name,
  });

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
