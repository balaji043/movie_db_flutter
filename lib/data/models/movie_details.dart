// Project imports:
import 'package:movie_db/domain/entities/movie_entity.dart';
import 'configuration.dart';
import 'core.dart';

class MovieDetails extends MovieEntity {
  final bool adult;
  final String backdropPath;
  final dynamic belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final List<ProductionCompany> productionCompanies;
  final List<Country> productionCountries;
  final int revenue;
  final int runtime;
  final List<Language> spokenLanguages;
  final String status;
  final String tagline;
  final bool video;
  final num voteCount;

  const MovieDetails({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.productionCompanies,
    this.productionCountries,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.video,
    this.voteCount,
    int id,
    String posterPath,
    String releaseDate,
    String title,
    double voteAverage,
  }) : super(
          id: id,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          voteAverage: voteAverage,
        );

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        adult: json["adult"] as bool,
        backdropPath: json["backdrop_path"] as String,
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"] as int,
        genres: json["genres"] == null
            ? null
            : List<Genre>.from(
                (json["genres"] as List).map(
                  (x) => Genre.fromJson(x as Map<String, dynamic>),
                ),
              ),
        homepage: json["homepage"] as String,
        id: json["id"] as int,
        imdbId: json["imdb_id"] as String,
        originalLanguage: json["original_language"] as String,
        originalTitle: json["original_title"] as String,
        overview: json["overview"] as String,
        popularity:
            json["popularity"] == null ? null : json["popularity"] as double,
        posterPath: json["poster_path"] as String,
        productionCompanies: json["production_companies"] == null
            ? null
            : List<ProductionCompany>.from(
                (json["production_companies"] as List).map(
                  (x) => ProductionCompany.fromJson(x as Map<String, dynamic>),
                ),
              ),
        productionCountries: json["production_countries"] == null
            ? null
            : List<Country>.from((json["production_countries"] as List)
                .map((x) => Country.fromJson(x as Map<String, dynamic>))),
        releaseDate: json["release_date"] as String,
        revenue: json["revenue"] as int,
        runtime: json["runtime"] as int,
        spokenLanguages: json["spoken_languages"] == null
            ? null
            : List<Language>.from((json["spoken_languages"] as List)
                .map((x) => Language.fromJson(x as Map<String, dynamic>))),
        status: json["status"] as String,
        tagline: json["tagline"] as String,
        title: json["title"] as String,
        video: json["video"] as bool,
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"] as double,
        voteCount: json["vote_count"] as num,
      );
}
