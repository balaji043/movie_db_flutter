class Gravatar {
  Gravatar({
    this.hash,
  });

  String hash;

  factory Gravatar.fromJson(Map<String, dynamic> json) => Gravatar(
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "hash": hash,
      };
}
