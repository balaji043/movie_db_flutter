import 'dart:convert';

import 'package:flutter/material.dart';

import 'base_model.dart';

class Paginate<T extends BaseModel> {
  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;
  Paginate({
    @required this.page,
    @required this.results,
    @required this.totalPages,
    @required this.totalResults,
  });

  factory Paginate.fromJson(
          Map<String, dynamic> json, FromJsonModel<T> fromJsonModel) =>
      Paginate(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null
            ? null
            : List<T>.from(json["results"].map((x) => fromJsonModel(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "results": results == null
            ? null
            : List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages == null ? null : totalPages,
        "total_results": totalResults == null ? null : totalResults,
      };
}
