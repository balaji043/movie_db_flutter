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
          Text(
            content.dTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: AppColor.white,
                ),
          )
        ],
      );
}
