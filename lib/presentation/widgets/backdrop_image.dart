import 'package:flutter/material.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:transparent_image/transparent_image.dart';

class BackdropImage extends StatelessWidget {
  const BackdropImage({
    @required this.backdropPath,
    Key key,
  }) : super(key: key);

  final String backdropPath;

  @override
  Widget build(BuildContext context) => FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: getBDUrl(backdropPath, ImageUrl.w1280),
        fit: BoxFit.fitHeight,
      );
}
