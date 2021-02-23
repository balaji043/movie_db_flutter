// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final VoidCallback press;
  final IconData iconSrc;
  final bool isActive;

  const CustomButton({
    @required this.title,
    @required this.press,
    Key key,
    this.iconSrc,
    this.isActive = false,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(
          top: Sizes.dimen_20,
          bottom: Sizes.dimen_20,
        ),
        child: InkWell(
          onTap: widget.press,
          onHover: (bool isHoverState) =>
              setState(() => isHover = isHoverState),
          child: Row(
            children: <Widget>[
              if (widget.iconSrc != null)
                Icon(
                  widget.iconSrc,
                  color: widget.isActive || isHover
                      ? AppColor.white
                      : AppColor.inactiveWhite,
                )
              else
                const SizedBox.shrink(),
              const SizedBox(
                width: Sizes.dimen_32,
              ),
              Text(
                widget.title,
                style: TextStyle(
                  color: widget.isActive || isHover
                      ? AppColor.white
                      : AppColor.inactiveWhite,
                ),
              ),
            ],
          ),
        ),
      );
}
