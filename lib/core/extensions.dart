// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:movie_db/core/screen_util.dart';

/// Our design contains Neumorphism design and i made a extention for it

extension Neumorphism on Widget {
  /// We can apply it on any  widget
  Widget addNeumorphism({
    double borderRadius = 10.0,
    Offset offset = const Offset(5, 5),
    double blurRadius = 10,
    Color topShadowColor = Colors.white60,
    Color bottomShadowColor = const Color(0x26234395),
  }) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: offset,
              blurRadius: blurRadius,
              color: bottomShadowColor,
            ),
            BoxShadow(
              offset: Offset(-offset.dx, -offset.dx),
              blurRadius: blurRadius,
              color: topShadowColor,
            ),
          ],
        ),
        child: this,
      );
}

/// Extension on num for getting the correct height and width
extension SizeExtension on num {
  num get w => ScreenUtil.get().setWidth(this);

  num get h => ScreenUtil.get().setHeight(this);

  num get sp => ScreenUtil.get().setSp(this);
}

extension DateTimeExtension on DateTime {
  String get paddedString =>
      '${_pad(year, 4)}-${_pad(month, 2)}-${_pad(day, 2)}';

  String _pad(int i, int width) => i.toString().padLeft(width, '0');
}
