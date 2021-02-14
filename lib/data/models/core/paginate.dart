import 'base_model.dart';

class Paginate<T extends BaseModel> {
  int page;
  List<T> results;
  int totalPages;
  int totalResults;

  Paginate.fromJson(Map<String, dynamic> json, FromJsonModel<T> fromJsonModel) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    if (json['results'] != null) {
      var resultList = json['results'] as List;
      results = List<T>.from(resultList.map((e) => fromJsonModel(e)));
    }
  }
}

class Movie extends BaseModel {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  num voteAverage;
  int voteCount;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      releaseDate: json['release_date'],
      title: json['title'],
    );
  }

  @override
  Movie fromJsonModel(Map<String, dynamic> json) => Movie.fromJson(json);
}
