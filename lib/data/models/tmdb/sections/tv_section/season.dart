class Seasons {
  String airDate;
  int episodeCount;
  int id;
  String name;
  String overview;
  String posterPath;
  int seasonNumber;

  Seasons(
      {this.airDate,
      this.episodeCount,
      this.id,
      this.name,
      this.overview,
      this.posterPath,
      this.seasonNumber});

  Seasons.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeCount = json['episode_count'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    seasonNumber = json['season_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_date'] = this.airDate;
    data['episode_count'] = this.episodeCount;
    data['id'] = this.id;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['season_number'] = this.seasonNumber;
    return data;
  }
}
