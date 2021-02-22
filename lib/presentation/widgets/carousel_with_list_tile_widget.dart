import 'package:flutter/material.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/domain/entities/ui_params.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';
import 'package:movie_db/presentation/widgets/animated_indexed_stack.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        CachedNetworkImage(
          imageUrl:
              '${ApiConstants.tmdbImageBaseUrlV3}${content.dBackdropPath}',
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 5,
          left: 5,
          child: Container(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content.dTitle ?? '',
                  style: textTheme.bodyText1,
                ),
                Text(
                  content.dOverview ?? '',
                  style: textTheme.bodyText2,
                  maxLines: 5,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
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
        color: selected ? AppColor.inactiveWhite : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage.memoryNetwork(
              image: getPosterImageUrl(content.dPosterPath),
              placeholder: kTransparentImage,
            ),

            // Container(
            //   height: 76,
            //   width: 56,
            //   child: CachedNetworkImage(
            //     imageUrl: getPosterImageUrl(content.dPosterPath),
            //     fit: BoxFit.fill,
            //   ),
            // ),
            const SizedBox(width: Sizes.dimen_12),
            Expanded(
              child: Text(
                content.dTitle,
              ),
            )
          ],
        ),
      );
  String getPosterImageUrl(String posterPath) =>
      '${ApiConstants.tmdbImagePosterBaseUrlV3}$posterPath';
}
