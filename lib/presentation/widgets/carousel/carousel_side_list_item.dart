part of 'carousel.dart';

class ListItem extends StatelessWidget {
  final UIParam content;

  const ListItem({
    @required this.content,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieCarouselCardBloc, MovieCarouselCardState>(
        buildWhen: (previous, current) {
          if (previous is MovieCarouselCardChange &&
              current is MovieCarouselCardChange) {
            final previousId = previous.movie.dId;
            final currentId = current.movie.dId;
            return previousId == currentId ||
                currentId == content.dId ||
                previousId == content.dId;
          }
          return false;
        },
        builder: (context, state) {
          String id = content.dId;
          if (state is MovieCarouselCardChange) {
            id = state.movie.dId;
          }
          return Container(
            padding: const EdgeInsets.all(Sizes.dimen_12),
            color: id == content.dId ? Colors.blue[700] : AppColor.black2,
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
                      fit: BoxFit.scaleDown,
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
        },
      );
}
