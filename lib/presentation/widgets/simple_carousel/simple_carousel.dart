import 'package:flutter/material.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/data/models/backdrop.dart';
import 'package:movie_db/presentation/widgets/backdrop_image.dart';
import 'package:movie_db/presentation/widgets/responsive.dart';

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
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.dimen_20,
      ),
      height: isDesktop
          ? size.height * 0.8
          : isTablet
              ? size.height * 0.6
              : size.height * 0.4,
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
                if (controller.page == 0) {
                  controller.jumpToPage(
                    widget.contents.length - 1,
                  );
                } else {
                  controller.previousPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                  );
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SimpleCarouselButton(
              iconSrc: Icons.keyboard_arrow_right,
              onPressed: () {
                if (controller.page == widget.contents.length - 1) {
                  controller.jumpToPage(
                    0,
                  );
                } else {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
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
          child: BackdropImage(
            backdropPath: content.filePath,
          ),
        ),
      );
}
