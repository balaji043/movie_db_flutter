import 'package:flutter/material.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/domain/entities/ui_params.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';
import 'package:transparent_image/transparent_image.dart';

class ContentCard<T extends UIParam> extends StatelessWidget {
  final T content;
  const ContentCard({
    @required this.content,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              content.dTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: AppColor.white,
                  ),
            )
          else
            const SizedBox.shrink(),
          if (content.dReleaseDate != null)
            Text(
              content.dReleaseDate,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: AppColor.white,
                  ),
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
                  content.dRating,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: AppColor.white,
                      ),
                ),
              ),
            )
          else
            const SizedBox.shrink()
        ],
      );
}
