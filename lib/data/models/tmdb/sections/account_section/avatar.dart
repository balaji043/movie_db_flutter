import 'package:movie_db/lib.dart';

class Avatar {
  Avatar({
    this.gravatar,
  });

  Gravatar gravatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        gravatar: Gravatar.fromJson(json["gravatar"]),
      );

  Map<String, dynamic> toJson() => {
        "gravatar": gravatar.toJson(),
      };
}
