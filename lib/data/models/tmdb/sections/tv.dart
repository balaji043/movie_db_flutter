// To parse this JSON data, do
//
//     final tvDetails = tvDetailsFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:movie_db/data/models/tmdb/sections/season.dart';
import 'configuration.dart';
import 'core.dart';
import 'episode.dart';
import 'network.dart';

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
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        createdBy: json["created_by"] == null
            ? null
            : List<CreatedBy>.from(
                json["created_by"].map((x) => CreatedBy.fromJson(x))),
        episodeRunTime: json["episode_run_time"] == null
            ? null
            : List<int>.from(json["episode_run_time"].map((x) => x)),
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        genres: json["genres"] == null
            ? null
            : List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"] == null ? null : json["homepage"],
        id: json["id"] == null ? null : json["id"],
        inProduction:
            json["in_production"] == null ? null : json["in_production"],
        languages: json["languages"] == null
            ? null
            : List<String>.from(json["languages"].map((x) => x)),
        lastAirDate: json["last_air_date"] == null
            ? null
            : DateTime.parse(json["last_air_date"]),
        lastEpisodeToAir: json["last_episode_to_air"] == null
            ? null
            : Episode.fromJson(json["last_episode_to_air"]),
        name: json["name"] == null ? null : json["name"],
        nextEpisodeToAir: json["next_episode_to_air"],
        networks: json["networks"] == null
            ? null
            : List<Network>.from(
                json["networks"].map((x) => Network.fromJson(x))),
        numberOfEpisodes: json["number_of_episodes"] == null
            ? null
            : json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"] == null
            ? null
            : json["number_of_seasons"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"] == null
            ? null
            : json["original_language"],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        productionCompanies: json["production_companies"] == null
            ? null
            : List<Network>.from(
                json["production_companies"].map((x) => Network.fromJson(x))),
        productionCountries: json["production_countries"] == null
            ? null
            : List<Country>.from(
                json["production_countries"].map((x) => Country.fromJson(x))),
        seasons: json["seasons"] == null
            ? null
            : List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
        spokenLanguages: json["spoken_languages"] == null
            ? null
            : List<Language>.from(
                json["spoken_languages"].map((x) => Language.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
        tagline: json["tagline"] == null ? null : json["tagline"],
        type: json["type"] == null ? null : json["type"],
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath == null ? null : backdropPath,
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
        "homepage": homepage == null ? null : homepage,
        "id": id == null ? null : id,
        "in_production": inProduction == null ? null : inProduction,
        "languages": languages == null
            ? null
            : List<dynamic>.from(languages.map((x) => x)),
        "last_air_date": lastAirDate == null
            ? null
            : "${lastAirDate.year.toString().padLeft(4, '0')}-${lastAirDate.month.toString().padLeft(2, '0')}-${lastAirDate.day.toString().padLeft(2, '0')}",
        "last_episode_to_air":
            lastEpisodeToAir == null ? null : lastEpisodeToAir.toJson(),
        "name": name == null ? null : name,
        "next_episode_to_air": nextEpisodeToAir,
        "networks": networks == null
            ? null
            : List<dynamic>.from(networks.map((x) => x.toJson())),
        "number_of_episodes":
            numberOfEpisodes == null ? null : numberOfEpisodes,
        "number_of_seasons": numberOfSeasons == null ? null : numberOfSeasons,
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage == null ? null : originalLanguage,
        "original_name": originalName == null ? null : originalName,
        "overview": overview == null ? null : overview,
        "popularity": popularity == null ? null : popularity,
        "poster_path": posterPath == null ? null : posterPath,
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
        "status": status == null ? null : status,
        "tagline": tagline == null ? null : tagline,
        "type": type == null ? null : type,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
      };
}
