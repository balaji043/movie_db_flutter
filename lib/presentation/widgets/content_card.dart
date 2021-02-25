// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:transparent_image/transparent_image.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/domain/entities/ui_params.dart';

class ContentCard<T extends UIParam> extends StatelessWidget {
  final T content;
  final void Function() onTap;
  const ContentCard({
    @required this.content,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_16),
            child: FadeInImage.memoryNetwork(
              image: getBDUrl(content.dPosterPath, ImageUrl.w185),
              placeholder: kTransparentImage,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: Sizes.dimen_10),
          if (content.dTitle != null)
            Text(
              content.dTitle ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: textTheme.headline6,
            )
          else
            const SizedBox.shrink(),
          if (content.dReleaseDate != null)
            Text(
              content.dReleaseDate ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: textTheme.subtitle2,
            )
          else
            const SizedBox.shrink(),
          if (content.dRating != null)
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                child: Text(
                  content.dRating ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: textTheme.bodyText1,
                ),
              ),
            )
          else
            const SizedBox.shrink()
        ],
      ),
    );
  }
}
