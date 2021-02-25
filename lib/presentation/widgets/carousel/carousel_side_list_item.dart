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
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: Container(
          key: ValueKey<String>(content.dId.toString()),
          padding: const EdgeInsets.all(Sizes.dimen_12),
          color: selected ? Colors.blue[700] : AppColor.black2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                  content.dTitle ?? '',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              )
            ],
          ),
        ),
      );
}
