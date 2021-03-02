part of 'widgets.dart';

class ContentListView<T extends UIParam> extends StatelessWidget {
  final List<T> contents;
  final String title;
  final void Function(T) onTap;
  final void Function() viewAll;
  final double itemExtent;
  final double height;
  final String imageWidth;
  final bool isPosterImage;

  const ContentListView({
    @required this.contents,
    @required this.title,
    @required this.onTap,
    this.itemExtent = 200,
    this.height = 380,
    this.imageWidth = ImageUrl.w185,
    this.viewAll,
    this.isPosterImage = true,
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
            height: height,
            child: ListView.builder(
              itemCount: contents.length,
              scrollDirection: Axis.horizontal,
              itemExtent: itemExtent,
              itemBuilder: (context, index) {
                final content = contents.elementAt(index);
                return ContentCard(
                  image: getBDUrl(
                    isPosterImage ? content.dPosterPath : content.dBackdropPath,
                    imageWidth,
                  ),
                  title: content.dTitle,
                  subtitle: content.dReleaseDate,
                  badge: content.dRating,
                  onTap: () => onTap(content),
                );
              },
            ),
          ),
        ],
      );
}
