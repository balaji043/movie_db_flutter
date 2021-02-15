// To parse this JSON data, do
//
//     final tvDetails = tvDetailsFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'configuration.dart';
import 'core.dart';
import 'episode.dart';
import 'network.dart';
import 'season.dart';

TvDetails tvDetailsFromJson(String str) =>
    TvDetails.fromJson(json.decode(str) as Map<String, dynamic>);

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
        backdropPath: json["backdrop_path"] as String,
        createdBy: json["created_by"] == null
            ? null
            : List<CreatedBy>.from((json["created_by"] as List)
                .map((x) => CreatedBy.fromJson(x as Map<String, dynamic>))),
        episodeRunTime: json["episode_run_time"] == null
            ? null
            : List<int>.from((json["episode_run_time"] as List).map((x) => x)),
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"] as String),
        genres: json["genres"] == null
            ? null
            : List<Genre>.from((json["genres"] as List)
                .map((x) => Genre.fromJson(x as Map<String, dynamic>))),
        homepage: json["homepage"] as String,
        id: json["id"] as int,
        inProduction: json["in_production"] as bool,
        languages: json["languages"] == null
            ? null
            : List<String>.from((json["languages"] as List).map((x) => x)),
        lastAirDate: json["last_air_date"] == null
            ? null
            : DateTime.parse(json["last_air_date"] as String),
        lastEpisodeToAir: json["last_episode_to_air"] == null
            ? null
            : Episode.fromJson(
                json["last_episode_to_air"] as Map<String, dynamic>),
        name: json["name"] as String,
        nextEpisodeToAir: json["next_episode_to_air"],
        networks: json["networks"] == null
            ? null
            : List<Network>.from((json["networks"] as List)
                .map((x) => Network.fromJson(x as Map<String, dynamic>))),
        numberOfEpisodes: json["number_of_episodes"] as int,
        numberOfSeasons: json["number_of_seasons"] as int,
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from((json["origin_country"] as List).map((x) => x)),
        originalLanguage: json["original_language"] as String,
        originalName: json["original_name"] as String,
        overview: json["overview"] as String,
        popularity:
            json["popularity"] == null ? null : json["popularity"] as double,
        posterPath: json["poster_path"] as String,
        productionCompanies: json["production_companies"] == null
            ? null
            : List<Network>.from(
                (json["production_companies"] as List).map(
                  (x) => Network.fromJson(x as Map<String, dynamic>),
                ),
              ),
        productionCountries: json["production_countries"] == null
            ? null
            : List<Country>.from(
                (json["production_countries"] as List).map(
                  (x) => Country.fromJson(x as Map<String, dynamic>),
                ),
              ),
        seasons: json["seasons"] == null
            ? null
            : List<Season>.from(
                (json["seasons"] as List).map(
                  (x) => Season.fromJson(x as Map<String, dynamic>),
                ),
              ),
        spokenLanguages: json["spoken_languages"] == null
            ? null
            : List<Language>.from(
                (json["spoken_languages"] as List).map(
                  (x) => Language.fromJson(x as Map<String, dynamic>),
                ),
              ),
        status: json["status"] as String,
        tagline: json["tagline"] as String,
        type: json["type"] as String,
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"] as double,
        voteCount: json["vote_count"] as int,
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "created_by": createdBy == null
            ? null
            : List<dynamic>.from(createdBy.map((x) => x.toJson())),
        "episode_run_time": episodeRunTime == null
            ? null
            : List<dynamic>.from(episodeRunTime.map((x) => x)),
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "in_production": inProduction,
        "languages": languages == null
            ? null
            : List<dynamic>.from(languages.map((x) => x)),
        "last_air_date": lastAirDate == null
            ? null
            : "${lastAirDate.year.toString().padLeft(4, '0')}-${lastAirDate.month.toString().padLeft(2, '0')}-${lastAirDate.day.toString().padLeft(2, '0')}",
        "last_episode_to_air": lastEpisodeToAir?.toJson(),
        "name": name,
        "next_episode_to_air": nextEpisodeToAir,
        "networks": networks == null
            ? null
            : List<dynamic>.from(networks.map((x) => x.toJson())),
        "number_of_episodes": numberOfEpisodes,
        "number_of_seasons": numberOfSeasons,
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": productionCompanies == null
            ? null
            : List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries": productionCountries == null
            ? null
            : List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "seasons": seasons == null
            ? null
            : List<dynamic>.from(seasons.map((x) => x.toJson())),
        "spoken_languages": spokenLanguages == null
            ? null
            : List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "type": type,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
