// Dart imports:
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/domain/entities/ui_params.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';
import 'package:transparent_image/transparent_image.dart';

class CarouselCard extends StatelessWidget {
  final UIParam content;

  const CarouselCard({
    Key key,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: Stack(
        key: ValueKey<String>(content.dId.toString()),
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: 1,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: getBDUrl(content.dBackdropPath, ImageUrl.w1280),
              fit: BoxFit.fill,
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 0.3,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: AppColor.black.withOpacity(0.3),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        content.dTitle ?? '',
                        style: textTheme.headline4.copyWith(
                          color: AppColor.white,
                        ),
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        content.dOverview ?? '',
                        style:
                            textTheme.subtitle1.copyWith(color: AppColor.white),
                        maxLines: 12,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
