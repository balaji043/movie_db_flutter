part of 'widgets.dart';

class BackdropImage extends StatelessWidget {
  const BackdropImage({
    @required this.backdropPath,
    Key key,
  }) : super(key: key);

  final String backdropPath;

  @override
  Widget build(BuildContext context) => Image(
        image: CacheImage(
          getBDUrl(backdropPath, BackdropSize.w780),
        ),
        fit: BoxFit.fitHeight,
      );
}
