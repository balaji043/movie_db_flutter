// Flutter imports:
import 'package:flutter/material.dart';
import 'package:movie_db/core/screen_util.dart';

// Our design contains Neumorphism design and i made a extention for it
// We can apply it on any  widget

extension Neumorphism on Widget {
  Widget addNeumorphism({
    double borderRadius = 10.0,
    Offset offset = const Offset(5, 5),
    double blurRadius = 10,
    Color topShadowColor = Colors.white60,
    Color bottomShadowColor = const Color(0x26234395),
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
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
}

extension SizeExtension on num {
  num get _w => ScreenUtil.get().setWidth(this);

  num get _h => ScreenUtil.get().setHeight(this);

  num get _sp => ScreenUtil.get().setSp(this);

  int get wi => _w as int;
  int get hi => _h as int;
  int get spi => _sp as int;

  double get wd => _w as double;
  double get hd => _h as double;
  double get spd => _sp as double;
}
