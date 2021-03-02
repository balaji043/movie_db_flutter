part of 'widgets.dart';

class CustomImage extends StatelessWidget {
  final String image;

  const CustomImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) => Image(
        image: CacheImage(image),
        fit: BoxFit.fitWidth,
        errorBuilder: (_, d, s) => const Image(
          image: AssetImage(
            Assets.placeholderImage,
          ),
        ),
      );
}
