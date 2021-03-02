part of 'widgets.dart';

class ContentListView<T extends UIParam> extends StatelessWidget {
  final List<T> contents;
  final String title;
  final Size imageSize;
  final void Function(T) onTap;
  final void Function() viewAll;

  const ContentListView({
    @required this.contents,
    @required this.title,
    @required this.onTap,
    this.imageSize = PosterSize.w185,
    this.viewAll,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title ?? '',
                style: Theme.of(context).textTheme.headline6,
                maxLines: 1,
              ),
              if (viewAll != null)
                TextButton(
                  onPressed: viewAll,
                  child: const Text(Strings.viewAll),
                ),
            ],
          ),
          const SizedBox(
            height: Sizes.dimen_12,
          ),
          Container(
            height: imageSize.height * 1.35,
            child: ListView(
              scrollDirection: Axis.horizontal,
              itemExtent: imageSize.width * 1.1,
              children: contents
                  .map(
                    (content) => ContentCard(
                      imageSize: imageSize,
                      posterPath: content.dPosterPath,
                      title: content.dTitle,
                      subtitle: content.dReleaseDate,
                      badge: content.dRating,
                      onTap: () => onTap(content),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
}
