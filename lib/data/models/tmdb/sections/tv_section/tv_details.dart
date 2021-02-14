import 'package:movie_db/lib.dart';

class TVDetails {
  String backdropPath;
  List<CreatedBy> createdBy;
  List<int> episodeRunTime;
  String firstAirDate;
  List<Genres> genres;
  String homepage;
  int id;
  bool inProduction;
  List<String> languages;
  String lastAirDate;
  LastEpisodeToAir lastEpisodeToAir;
  String name;
  Null nextEpisodeToAir;
  List<Networks> networks;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountries> productionCountries;
  List<Seasons> seasons;
  List<SpokenLanguages> spokenLanguages;
  String status;
  String tagline;
  String type;
  double voteAverage;
  int voteCount;

  TVDetails(
      {this.backdropPath,
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
      this.voteCount});

  TVDetails.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    if (json['created_by'] != null)
      createdBy = (json['created_by'] as List)
          .map((v) => CreatedBy.fromJson(v))
          .toList();
    episodeRunTime = json['episode_run_time'].cast<int>();
    firstAirDate = json['first_air_date'];
    if (json['genres'] != null)
      genres = (json['genres'] as List).map((e) => Genres.fromJson(e)).toList();
    homepage = json['homepage'];
    id = json['id'];
    inProduction = json['in_production'];
    languages = json['languages'].cast<String>();
    lastAirDate = json['last_air_date'];
    lastEpisodeToAir = json['last_episode_to_air'] != null
        ? new LastEpisodeToAir.fromJson(json['last_episode_to_air'])
        : null;
    name = json['name'];
    nextEpisodeToAir = json['next_episode_to_air'];
    if (json['networks'] != null)
      networks =
          (json['networks'] as List).map((e) => Networks.fromJson(e)).toList();
    numberOfEpisodes = json['number_of_episodes'];
    numberOfSeasons = json['number_of_seasons'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null)
      productionCompanies = (json['production_companies'] as List)
          .map((e) => ProductionCompany.fromJson(e))
          .toList();
    if (json['production_countries'] != null)
      productionCountries = (json['production_countries'] as List)
          .map((e) => ProductionCountries.fromJson(e))
          .toList();
    if (json['seasons'] != null)
      seasons = (json['seasons'] as List)
          .map(
            (e) => Seasons.fromJson(e),
          )
          .toList();
    if (json['spoken_languages'] != null)
      spokenLanguages = (json['spoken_languages'] as List)
          .map((e) => SpokenLanguages.fromJson(e))
          .toList();
    status = json['status'];
    tagline = json['tagline'];
    type = json['type'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy.map((v) => v.toJson()).toList();
    }
    data['episode_run_time'] = this.episodeRunTime;
    data['first_air_date'] = this.firstAirDate;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this.homepage;
    data['id'] = this.id;
    data['in_production'] = this.inProduction;
    data['languages'] = this.languages;
    data['last_air_date'] = this.lastAirDate;
    if (this.lastEpisodeToAir != null) {
      data['last_episode_to_air'] = this.lastEpisodeToAir.toJson();
    }
    data['name'] = this.name;
    data['next_episode_to_air'] = this.nextEpisodeToAir;
    if (this.networks != null) {
      data['networks'] = this.networks.map((v) => v.toJson()).toList();
    }
    data['number_of_episodes'] = this.numberOfEpisodes;
    data['number_of_seasons'] = this.numberOfSeasons;
    data['origin_country'] = this.originCountry;
    data['original_language'] = this.originalLanguage;
    data['original_name'] = this.originalName;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    if (this.productionCompanies != null) {
      data['production_companies'] =
          this.productionCompanies.map((v) => v.toJson()).toList();
    }
    if (this.productionCountries != null) {
      data['production_countries'] =
          this.productionCountries.map((v) => v.toJson()).toList();
    }
    if (this.seasons != null) {
      data['seasons'] = this.seasons.map((v) => v.toJson()).toList();
    }
    if (this.spokenLanguages != null) {
      data['spoken_languages'] =
          this.spokenLanguages.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['tagline'] = this.tagline;
    data['type'] = this.type;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}
