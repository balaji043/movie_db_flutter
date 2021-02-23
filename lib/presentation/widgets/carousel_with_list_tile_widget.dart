// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:transparent_image/transparent_image.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/domain/entities/ui_params.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';
import 'package:movie_db/presentation/widgets/animated_indexed_stack.dart';

class CarouselWithListTileWidget<T extends UIParam> extends StatefulWidget {
  final List<T> contents;

  const CarouselWithListTileWidget({
    Key key,
    this.contents,
  }) : super(key: key);

  @override
  _CarouselWithListTileWidgetState createState() =>
      _CarouselWithListTileWidgetState();
}

class _CarouselWithListTileWidgetState<T extends UIParam>
    extends State<CarouselWithListTileWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Container(
        height: 500,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_16)),
          child: Container(
            color: AppColor.black2,
            child: Stack(
              fit: StackFit.expand,
              children: <FractionallySizedBox>[
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.8,
                  child: AnimatedIndexedStack(
                    index: selectedIndex,
                    children: widget.contents
                        .map(
                          (e) => CarouselCard(
                            content: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.centerRight,
                  widthFactor: 0.2,
                  child: _SideListView(
                    contents: widget.contents,
                    onTap: onTapOfListItem,
                    selectedIndex: selectedIndex,
                  ),
                )
              ],
            ),
          ),
        ),
      );

  void onTapOfListItem(int index) => setState(() => selectedIndex = index);
}

class _SideListView<T extends UIParam> extends StatelessWidget {
  final Function(int) onTap;
  final List<T> contents;
  final int selectedIndex;

  const _SideListView({
    @required this.onTap,
    @required this.contents,
    @required this.selectedIndex,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemExtent: 100,
        itemBuilder: (BuildContext context, int index) {
          final T content = contents[index];
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(index),
            child: _ListItem(
              content: content,
              selected: index == selectedIndex,
            ),
          );
        },
        itemCount: contents?.length ?? 0,
      );
}

class CarouselCard<T extends UIParam> extends StatelessWidget {
  final T content;
  const CarouselCard({
    this.content,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Stack(
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
    );
  }
}

class _ListItem<T extends UIParam> extends StatelessWidget {
  final T content;
  final bool selected;
  const _ListItem({
    @required this.content,
    @required this.selected,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(Sizes.dimen_12),
        color: selected ? AppColor.black2 : AppColor.black,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 76,
              width: 56,
              child: FadeInImage.memoryNetwork(
                image: getBDUrl(content.dPosterPath, ImageUrl.w154),
                placeholder: kTransparentImage,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: Sizes.dimen_12),
            Expanded(
              child: Text(
                content.dTitle,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: AppColor.white,
                    ),
              ),
            )
          ],
        ),
      );
}
