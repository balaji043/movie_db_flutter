// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:movie_db/data/models/configuration.dart';
import 'package:movie_db/data/models/images_response.dart';
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';

class MovieDetails extends MovieEntity {
  final bool adult;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final double popularity;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final int revenue;
  final int runtime;
  final List<Language> spokenLanguages;
  final String status;
  final String tagline;
  final bool video;
  final int voteCount;
  final ImageResponse images;
  const MovieDetails({
    this.adult,
    this.budget,
    this.genres,
    this.homepage,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
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
    this.images,
    int id,
    String title,
    num voteAverage,
    String posterPath,
    String releaseDate,
    String backdropPath,
    String overview,
  }) : super(
          id: id,
          title: title,
          voteAverage: voteAverage,
          posterPath: posterPath,
          releaseDate: releaseDate,
          backdropPath: backdropPath,
          overview: overview,
        );
  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'adult': adult,
        'backdrop_path': backdropPath,
        'budget': budget,
        'genres': genres?.map((Genre x) => x?.toMap())?.toList(),
        'homepage': homepage,
        'id': id,
        'imdb_id': imdbId,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'production_companies': productionCompanies
            ?.map((ProductionCompany x) => x?.toMap())
            ?.toList(),
        'production_countries': productionCountries
            ?.map((ProductionCountry x) => x?.toMap())
            ?.toList(),
        'release_date': releaseDate,
        'revenue': revenue,
        'runtime': runtime,
        'spoken_languages':
            spokenLanguages?.map((Language x) => x?.toMap())?.toList(),
        'status': status,
        'tagline': tagline,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'images': images?.toMap(),
      };

  factory MovieDetails.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return MovieDetails(
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      budget: map['budget']?.toInt(),
      genres: map['geners'] != null
          ? List<Genre>.from(
              map['genres']?.map((Map<String, dynamic> x) => Genre.fromMap(x)))
          : <Genre>[],
      homepage: map['homepage'],
      id: map['id']?.toInt(),
      imdbId: map['imdb_id'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity']?.toDouble(),
      posterPath: map['poster_path'],
      productionCompanies: map['production_companies'] != null
          ? List<ProductionCompany>.from(
              map['production_companies']?.map(
                (dynamic json) => ProductionCompany.fromMap(json),
              ),
            )
          : [],
      productionCountries: map['production_countries'] != null
          ? List<ProductionCountry>.from(
              map['production_countries']?.map(
                (dynamic json) => ProductionCountry.fromMap(json),
              ),
            )
          : <ProductionCountry>[],
      releaseDate: map['release_date'],
      revenue: map['revenue']?.toInt(),
      runtime: map['runtime']?.toInt(),
      spokenLanguages: map['spoken_languages'] != null
          ? List<Language>.from(
              map['spoken_languages']?.map(
                (dynamic json) => Language.fromMap(json),
              ),
            )
          : <Language>[],
      status: map['status'],
      tagline: map['tagline'],
      title: map['title'],
      video: map['video'],
      voteAverage: map['vote_average']?.toDouble(),
      voteCount: map['vote_count']?.toInt(),
      images: ImageResponse.fromMap(map['images']),
    );
  }

  factory MovieDetails.fromJson(String source) =>
      MovieDetails.fromMap(json.decode(source));

  @override
  List<Object> get props => <Object>[
        adult,
        backdropPath,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
        images,
      ];
}
