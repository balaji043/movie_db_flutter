import 'configuration.dart';
import 'core.dart';

class MovieDetails {
  MovieDetails({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool adult;
  String backdropPath;
  dynamic belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompany> productionCompanies;
  List<Country> productionCountries;
  DateTime releaseDate;
  int revenue;
  int runtime;
  List<Language> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"] == null ? null : json["budget"],
        genres: json["genres"] == null
            ? null
            : List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"] == null ? null : json["homepage"],
        id: json["id"] == null ? null : json["id"],
        imdbId: json["imdb_id"] == null ? null : json["imdb_id"],
        originalLanguage: json["original_language"] == null
            ? null
            : json["original_language"],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: json["production_companies"] == null
            ? null
            : List<ProductionCompany>.from(json["production_companies"]
                .map((x) => ProductionCompany.fromJson(x))),
        productionCountries: json["production_countries"] == null
            ? null
            : List<Country>.from(
                json["production_countries"].map((x) => Country.fromJson(x))),
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        revenue: json["revenue"] == null ? null : json["revenue"],
        runtime: json["runtime"] == null ? null : json["runtime"],
        spokenLanguages: json["spoken_languages"] == null
            ? null
            : List<Language>.from(
                json["spoken_languages"].map((x) => Language.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
        tagline: json["tagline"] == null ? null : json["tagline"],
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget == null ? null : budget,
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage == null ? null : homepage,
        "id": id == null ? null : id,
        "imdb_id": imdbId == null ? null : imdbId,
        "original_language": originalLanguage == null ? null : originalLanguage,
        "original_title": originalTitle == null ? null : originalTitle,
        "overview": overview == null ? null : overview,
        "popularity": popularity == null ? null : popularity,
        "poster_path": posterPath,
        "production_companies": productionCompanies == null
            ? null
            : List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries": productionCountries == null
            ? null
            : List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "release_date": releaseDate == null
            ? null
            : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "revenue": revenue == null ? null : revenue,
        "runtime": runtime == null ? null : runtime,
        "spoken_languages": spokenLanguages == null
            ? null
            : List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status == null ? null : status,
        "tagline": tagline == null ? null : tagline,
        "title": title == null ? null : title,
        "video": video == null ? null : video,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
      };
}
