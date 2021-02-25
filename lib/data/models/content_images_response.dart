// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'backdrop.dart';

class ImageResponse extends Equatable {
  final int id;
  final List<ImageModel> backdrops;
  final List<ImageModel> posters;
  const ImageResponse({
    this.id,
    this.backdrops,
    this.posters,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'backdrops': backdrops?.map((ImageModel x) => x?.toMap())?.toList(),
        'posters': posters?.map((ImageModel x) => x?.toMap())?.toList(),
      };

  factory ImageResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return ImageResponse(
      id: map['id']?.toInt(),
      backdrops: List<ImageModel>.from(
        map['backdrops']
            ?.map((Map<String, dynamic> x) => ImageModel.fromMap(x)),
      ),
      posters: List<ImageModel>.from(
        map['posters']?.map(
          (Map<String, dynamic> x) => ImageModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageResponse.fromJson(String source) =>
      ImageResponse.fromMap(json.decode(source));

  @override
  List<Object> get props => <Object>[id, backdrops, posters];
}
