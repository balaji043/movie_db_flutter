part of 'carousel.dart';

class CarouselCard extends StatefulWidget {
  final UIParam content;

  const CarouselCard({
    Key key,
    this.content,
  }) : super(key: key);

  @override
  _CarouselCardState createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Tween<Offset> tweenOffset;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    tweenOffset = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    );
  }

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        switchInCurve: Curves.fastOutSlowIn,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
        ) =>
            SlideTransition(
          position: tweenOffset.animate(animation),
          child: child,
        ),
        child: Stack(
          key: ValueKey<String>(widget.content.dId.toString()),
          fit: StackFit.expand,
          children: <Widget>[
            FractionallySizedBox(
              alignment: Alignment.centerRight,
              widthFactor: 1,
              child: CustomImage(
                path: widget.content.dBackdropPath,
                size: BackdropSize.w780,
                fit: BoxFit.cover,
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.3,
              child: CarouselTextOverlay(
                overview: widget.content.dOverview,
                title: widget.content.dTitle,
              ),
            )
          ],
        ),
      );
}

class CarouselTextOverlay extends StatelessWidget {
  final String title;
  final String overview;

  const CarouselTextOverlay({
    @required this.title,
    @required this.overview,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isMobile = Responsive.isMobile(context);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: AppColor.black.withOpacity(0.3),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title ?? '',
                style: isDesktop || isTablet
                    ? textTheme.headline4
                    : textTheme.bodyText1,
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              if (!isMobile)
                Text(
                  overview ?? '',
                  style: textTheme.subtitle1,
                  maxLines: isTablet ? 8 : 12,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
