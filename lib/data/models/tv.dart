// To parse this JSON data, do
//
//     final tvDetails = tvDetailsFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:movie_db/core/extensions.dart';
import 'configuration.dart';
import 'core.dart';
import 'episode.dart';
import 'network.dart';
import 'season.dart';

TvDetails tvDetailsFromJson(String str) => TvDetails.fromJson(json.decode(str));

String tvDetailsToJson(TvDetails data) => json.encode(data.toJson());

class TvDetails {
  TvDetails({
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  String backdropPath;
  List<CreatedBy> createdBy;
  List<int> episodeRunTime;
  DateTime firstAirDate;
  List<Genre> genres;
  String homepage;
  int id;
  bool inProduction;
  List<String> languages;
  DateTime lastAirDate;
  Episode lastEpisodeToAir;
  String name;
  dynamic nextEpisodeToAir;
  List<Network> networks;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  List<Network> productionCompanies;
  List<Country> productionCountries;
  List<Season> seasons;
  List<Language> spokenLanguages;
  String status;
  String tagline;
  String type;
  double voteAverage;
  int voteCount;

  factory TvDetails.fromJson(Map<String, dynamic> json) => TvDetails(
        backdropPath: json['backdrop_path'],
        createdBy: json['created_by'] == null
            ? null
            : List<CreatedBy>.from(
                (json['created_by']).map((dynamic x) => CreatedBy.fromJson(x))),
        episodeRunTime: json['episode_run_time'] == null
            ? null
            : List<int>.from((json['episode_run_time']).map((dynamic x) => x)),
        firstAirDate: json['first_air_date'] == null
            ? null
            : DateTime.parse(json['first_air_date']),
        genres: json['genres'] == null
            ? null
            : List<Genre>.from(
                (json['genres']).map((dynamic x) => Genre.fromJson(x))),
        homepage: json['homepage'],
        id: json['id'],
        inProduction: json['in_production'],
        languages: json['languages'] == null
            ? null
            : List<String>.from((json['languages']).map((dynamic x) => x)),
        lastAirDate: json['last_air_date'] == null
            ? null
            : DateTime.parse(json['last_air_date']),
        lastEpisodeToAir: json['last_episode_to_air'] == null
            ? null
            : Episode.fromJson(json['last_episode_to_air']),
        name: json['name'],
        nextEpisodeToAir: json['next_episode_to_air'],
        networks: json['networks'] == null
            ? null
            : List<Network>.from(
                (json['networks']).map((dynamic x) => Network.fromJson(x))),
        numberOfEpisodes: json['number_of_episodes'],
        numberOfSeasons: json['number_of_seasons'],
        originCountry: json['origin_country'] == null
            ? null
            : List<String>.from((json['origin_country']).map((dynamic x) => x)),
        originalLanguage: json['original_language'],
        originalName: json['original_name'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        productionCompanies: json['production_companies'] == null
            ? null
            : List<Network>.from(
                (json['production_companies']).map(
                  (dynamic x) => Network.fromJson(x),
                ),
              ),
        productionCountries: json['production_countries'] == null
            ? null
            : List<Country>.from(
                (json['production_countries']).map(
                  (dynamic x) => Country.fromJson(x),
                ),
              ),
        seasons: json['seasons'] == null
            ? null
            : List<Season>.from(
                (json['seasons']).map(
                  (dynamic x) => Season.fromJson(x),
                ),
              ),
        spokenLanguages: json['spoken_languages'] == null
            ? null
            : List<Language>.from(
                (json['spoken_languages']).map(
                  (dynamic x) => Language.fromJson(x),
                ),
              ),
        status: json['status'],
        tagline: json['tagline'],
        type: json['type'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'backdrop_path': backdropPath,
        'created_by': createdBy == null
            ? null
            : List<dynamic>.from(createdBy.map((dynamic x) => x.toJson())),
        'episode_run_time': episodeRunTime == null
            ? null
            : List<dynamic>.from(episodeRunTime.map((dynamic x) => x)),
        'first_air_date': firstAirDate?.paddedString,
        'genres': genres == null
            ? null
            : List<dynamic>.from(genres.map((dynamic x) => x.toJson())),
        'homepage': homepage,
        'id': id,
        'in_production': inProduction,
        'languages': languages == null
            ? null
            : List<dynamic>.from(languages.map((dynamic x) => x)),
        'last_air_date': lastAirDate?.paddedString,
        'last_episode_to_air': lastEpisodeToAir?.toJson(),
        'name': name,
        'next_episode_to_air': nextEpisodeToAir,
        'networks': networks == null
            ? null
            : List<dynamic>.from(networks.map((dynamic x) => x.toJson())),
        'number_of_episodes': numberOfEpisodes,
        'number_of_seasons': numberOfSeasons,
        'origin_country': originCountry == null
            ? null
            : List<dynamic>.from(originCountry.map((dynamic x) => x)),
        'original_language': originalLanguage,
        'original_name': originalName,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'production_companies': productionCompanies == null
            ? null
            : List<dynamic>.from(
                productionCompanies.map((dynamic x) => x.toJson())),
        'production_countries': productionCountries == null
            ? null
            : List<dynamic>.from(
                productionCountries.map((dynamic x) => x.toJson())),
        'seasons': seasons == null
            ? null
            : List<dynamic>.from(seasons.map((dynamic x) => x.toJson())),
        'spoken_languages': spokenLanguages == null
            ? null
            : List<dynamic>.from(
                spokenLanguages.map((dynamic x) => x.toJson())),
        'status': status,
        'tagline': tagline,
        'type': type,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
