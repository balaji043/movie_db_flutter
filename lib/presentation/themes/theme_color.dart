// Flutter imports:
import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();

  static const Color inactiveWhite = MaterialColor(0xFF848484, <int, Color>{});
  static const Color white = MaterialColor(0xFFF2F2F2, <int, Color>{});
  static const Color black = MaterialColor(0xFF121212, <int, Color>{});
  static const Color black2 = MaterialColor(0xFF202020, <int, Color>{});
  static const Color blackOpacity = MaterialColor(0x01121212, <int, Color>{});

  static const Color green = MaterialColor(0xFF3BBFAB, <int, Color>{});
}

const BorderSide borderSide = BorderSide(color: AppColor.green);
