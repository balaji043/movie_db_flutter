part of 'carousel.dart';

class ListItem extends StatelessWidget {
  final UIParam content;
  final bool selected;
  const ListItem({
    @required this.content,
    @required this.selected,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(Sizes.dimen_12),
        color: selected ? Colors.blue[700] : AppColor.black2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 76,
              width: 56,
              child: Image(
                image: CacheImage(
                  getBDUrl(content.dPosterPath, PosterSize.w92),
                ),
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => const Image(
                  image: AssetImage(
                    Assets.placeholderImage,
                  ),
                ),
              ),
            ),
            const SizedBox(width: Sizes.dimen_12),
            Expanded(
              child: Text(
                content.dTitle ?? '',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            )
          ],
        ),
      );
}
