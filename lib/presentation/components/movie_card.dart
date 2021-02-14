import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_db/common/utils/app_colors.dart';
import 'package:movie_db/controllers/configuration_controller.dart';
import 'package:movie_db/data/models/data_content.dart';
import 'package:movie_db/presentation/components/rating_widget.dart';

final double width = 154;

class MovieCardWidget extends StatelessWidget {
  final DataContent dataContent;
  MovieCardWidget({
    Key key,
    this.dataContent,
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
                  posterPath: dataContent?.posterPath,
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
                    voteAverage: dataContent.voteAverage * 10,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              dataContent.title,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              semanticsLabel: dataContent.title,
              textAlign: TextAlign.start,
              overflow: TextOverflow.fade,
            ),
          ),
          Text(
            dataContent.releaseDate,
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
