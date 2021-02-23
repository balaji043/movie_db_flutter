import 'package:flutter/material.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';

class SimpleCarouselButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData iconSrc;

  const SimpleCarouselButton({
    @required this.onPressed,
    @required this.iconSrc,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.dimen_10),
          ),
          color: AppColor.green,
          border: Border(
            top: borderSide,
            bottom: borderSide,
            left: borderSide,
            right: borderSide,
          ),
        ),
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.dimen_10),
          ),
          child: MaterialButton(
            minWidth: Sizes.dimen_48,
            height: Sizes.dimen_48,
            onPressed: onPressed,
            color: AppColor.black,
            hoverColor: AppColor.green,
            child: Icon(
              iconSrc,
              color: AppColor.white,
            ),
          ),
        ),
      );
}
