// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData iconSrc;
  final bool isActive;

  const CustomButton({
    @required this.onPressed,
    this.title,
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
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onPressed,
        onHover: (bool isHoverState) => setState(() => isHover = isHoverState),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.dimen_16,
          ),
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
                width: Sizes.dimen_10,
              ),
              if (widget.title != null)
                Text(
                  widget.title ?? '',
                  style: textTheme.button.copyWith(
                    color: widget.isActive || isHover
                        ? AppColor.white
                        : AppColor.inactiveWhite,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
