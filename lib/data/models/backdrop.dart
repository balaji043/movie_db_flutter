import 'dart:convert';

import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  final double aspectRatio;
  final String filePath;
  final int height;
  final String iso6391;
  final int voteAverage;
  final int voteCount;
  final int width;
  const ImageModel({
    this.aspectRatio,
    this.filePath,
    this.height,
    this.iso6391,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  Map<String, dynamic> toMap() => {
        'aspect_ratio': aspectRatio,
        'file_path': filePath,
        'height': height,
        'iso_639_1': String,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'width': width,
      };

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return ImageModel(
      aspectRatio: map['aspect_ratio']?.toDouble(),
      filePath: map['file_path'],
      height: map['height']?.toInt(),
      iso6391: map['iso_639_1'],
      voteAverage: map['vote_average']?.toInt(),
      voteCount: map['vote_count']?.toInt(),
      width: map['width']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source));

  @override
  List<Object> get props => [
        aspectRatio,
        filePath,
        height,
        iso6391,
        voteAverage,
        voteCount,
        width,
      ];
}
