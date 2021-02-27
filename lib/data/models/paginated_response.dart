part of 'models.dart';

class PaginatedResponse<T> extends Equatable {
  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;

  const PaginatedResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    List<T> results = [];
    final dynamic jsonList = json['results'];
    if (jsonList != null) {
      results = List<T>.from(
        jsonList.map(
          (dynamic v) => fromJson(v),
        ),
      );
    }
    return PaginatedResponse(
      page: json['page'],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
      results: results,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function() toJsonModel) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results
              .map(
                (dynamic v) => toJsonModel(),
              )
              .toList() ??
          [];
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }

  @override
  List<Object> get props => [page, results, totalPages, totalResults];
}
