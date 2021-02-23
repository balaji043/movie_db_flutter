import 'package:flutter/material.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/data/models/backdrop.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:transparent_image/transparent_image.dart';

import 'simple_carousel_button.dart';

class SimpleCarousel extends StatefulWidget {
  final List<ImageModel> contents;

  const SimpleCarousel({
    @required this.contents,
    Key key,
  }) : super(key: key);

  @override
  _SimpleCarouselState createState() => _SimpleCarouselState();
}

class _SimpleCarouselState extends State<SimpleCarousel> {
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(
      viewportFraction: 0.8,
      keepPage: false,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.dimen_20,
        ),
        height: 500,
        child: Stack(
          children: [
            FractionallySizedBox(
              widthFactor: 1,
              child: PageView.builder(
                controller: controller,
                itemCount: widget.contents.length,
                itemBuilder: (context, index) =>
                    SimpleCarouselCard(content: widget.contents[index]),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SimpleCarouselButton(
                iconSrc: Icons.keyboard_arrow_left,
                onPressed: () {
                  controller.previousPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SimpleCarouselButton(
                iconSrc: Icons.keyboard_arrow_right,
                onPressed: () {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
          ],
        ),
      );
}

class SimpleCarouselCard extends StatelessWidget {
  final ImageModel content;

  const SimpleCarouselCard({
    @required this.content,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.dimen_16),
          ),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            key: ValueKey<String>(content.filePath),
            fit: BoxFit.fitWidth,
            image: getBDUrl(
              content.filePath,
              ImageUrl.w1280,
            ),
          ),
        ),
      );
}
