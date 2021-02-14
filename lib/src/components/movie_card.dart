// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:movie_db/presentation/app_colors.dart';
import 'package:movie_db/src/controllers/configuration_controller.dart';
import 'rating_widget.dart';

final double width = 154;

class MovieCardWidget extends StatelessWidget {
  final String title;
  final String voteAverage;
  final String posterPath;
  final String releaseDate;

  const MovieCardWidget({
    Key key,
    @required this.title,
    @required this.voteAverage,
    @required this.posterPath,
    @required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 430,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 240,
            child: Stack(
              children: [
                _Poster(
                  posterPath: posterPath,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: _MoreVertButton(),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: RatingWidget(
                    voteAverage: voteAverage,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              title ?? "",
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              semanticsLabel: title,
              textAlign: TextAlign.start,
              overflow: TextOverflow.fade,
            ),
          ),
          Text(
            releaseDate ?? "",
            style: Theme.of(context).textTheme.overline,
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}

class _MoreVertButton extends StatelessWidget {
  const _MoreVertButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(Size(25, 25)),
      elevation: 0,
      child: Icon(
        Icons.more_horiz_rounded,
        size: 20,
        color: kPrimaryColor,
      ),
      onPressed: () {},
      fillColor: kBgLightColor,
      shape: CircleBorder(),
    );
  }
}

class _Poster extends StatelessWidget {
  const _Poster({
    Key key,
    @required this.posterPath,
  }) : super(key: key);

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: GetX<ConfigurationController>(
        builder: (controller) {
          var images = controller?.appConfiguration?.value?.images;
          if (images == null ||
              images.posterSizes == null ||
              images.baseUrl == null) return Container();
          return Image.network(
            '${images?.baseUrl}/${images?.posterSizes?.elementAt(2)}/$posterPath',
          );
        },
      ),
    );
  }
}
