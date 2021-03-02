part of 'widgets.dart';

class CustomImage extends StatelessWidget {
  final Size size;
  final String path;
  final BoxFit fit;
  const CustomImage({
    @required this.path,
    @required this.size,
    this.fit = BoxFit.fitWidth,
    Key key,
  })  : assert(path != null, 'path is required'),
        assert(size != null, 'size is required'),
        super(key: key);

  @override
  Widget build(BuildContext context) => FadeInImage(
        fadeInDuration: const Duration(milliseconds: 10),
        height: size.height,
        width: size.width,
        fit: fit,
        imageErrorBuilder: (context, error, stackTrace) => const Image(
          image: AssetImage(Assets.placeholderImage),
        ),
        image: CacheImage(
          getBDUrl(path, size),
        ),
        placeholder: const AssetImage(Assets.placeholderImage),
      );
}
