part of 'widgets.dart';

class BackdropImage extends StatelessWidget {
  const BackdropImage({
    @required this.backdropPath,
    Key key,
  }) : super(key: key);

  final String backdropPath;

  @override
  Widget build(BuildContext context) => FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: getBDUrl(backdropPath, ImageUrl.w1280),
        fit: BoxFit.fitHeight,
      );
}
