part of 'widgets.dart';

class ContentCard extends StatelessWidget {
  final String image;
  final Size imageSize;
  final String title;
  final String subtitle;
  final String badge;
  final void Function() onTap;

  const ContentCard({
    @required this.image,
    @required this.imageSize,
    @required this.title,
    @required this.onTap,
    this.subtitle,
    this.badge,
    Key key,
  })  : assert(image != null, 'image url is required'),
        assert(title != null, 'title is required'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_16),
              child: CustomImage(
                image: image,
              ),
            ),
            const SizedBox(height: Sizes.dimen_12),
            if (title != null)
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: textTheme.headline6,
              ),
            if (subtitle != null)
              Text(
                subtitle,
                overflow: TextOverflow.ellipsis,
                style: textTheme.subtitle2,
              ),
            if (badge != null)
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: Text(
                    badge ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: textTheme.bodyText1,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
