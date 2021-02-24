// Dart imports:
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/domain/entities/ui_params.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';
import 'package:transparent_image/transparent_image.dart';

class CarouselCard extends StatefulWidget {
  final UIParam content;

  const CarouselCard({
    Key key,
    this.content,
  }) : super(key: key);

  @override
  _CarouselCardState createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Tween<Offset> tweenOffset;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    tweenOffset = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      switchInCurve: Curves.fastOutSlowIn,
      transitionBuilder: (child, animation) => SlideTransition(
        position: tweenOffset.animate(animation),
        child: child,
      ),
      child: Stack(
        key: ValueKey<String>(widget.content.dId.toString()),
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: 1,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: getBDUrl(widget.content.dBackdropPath, ImageUrl.w1280),
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
                        widget.content.dTitle ?? '',
                        style: textTheme.headline4,
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.content.dOverview ?? '',
                        style: textTheme.subtitle1,
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
