// Project imports:
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';
import '../../../../data/models/configuration.dart';
import '../../../../data/models/core.dart';

class MovieDetails extends MovieEntity {
  final bool adult;
  final dynamic belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
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
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    String overview,
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
    num voteAverage,
    String backdropPath,
  }) : super(
          id: id,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          voteAverage: voteAverage,
          backdropPath: backdropPath,
          overview: overview,
        );

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        belongsToCollection: json['belongs_to_collection'],
        budget: json['budget'],
        genres: json['genres'] == null
            ? null
            : List<Genre>.from(
                (json['genres']).map(
                  (dynamic x) => Genre.fromJson(x),
                ),
              ),
        homepage: json['homepage'],
        id: json['id'],
        imdbId: json['imdb_id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        productionCompanies: json['production_companies'] == null
            ? null
            : List<ProductionCompany>.from(
                (json['production_companies']).map(
                  (dynamic x) => ProductionCompany.fromJson(x),
                ),
              ),
        productionCountries: json['production_countries'] == null
            ? null
            : List<Country>.from((json['production_countries'])
                .map((dynamic x) => Country.fromJson(x))),
        releaseDate: json['release_date'],
        revenue: json['revenue'],
        runtime: json['runtime'],
        spokenLanguages: json['spoken_languages'] == null
            ? null
            : List<Language>.from((json['spoken_languages'])
                .map((dynamic x) => Language.fromJson(x))),
        status: json['status'],
        tagline: json['tagline'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
      );
}
