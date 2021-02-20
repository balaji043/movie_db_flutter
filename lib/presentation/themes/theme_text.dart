// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:movie_db/core/extensions.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _bodyText1 => _poppinsTextTheme.bodyText1.copyWith(
        color: AppColor.white,
        fontSize: Sizes.dimen_18.sp,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get _buttonText => _poppinsTextTheme.button.copyWith(
        fontSize: Sizes.dimen_4.sp,
        color: AppColor.white,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get _subtitle1Text => _poppinsTextTheme.subtitle1.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: AppColor.inactiveWhite,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get _headline1Text => _poppinsTextTheme.headline1.copyWith(
        fontSize: Sizes.dimen_24.sp,
        color: AppColor.white,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get _headline2Text => _poppinsTextTheme.headline2.copyWith(
        fontSize: Sizes.dimen_18.sp,
        color: AppColor.white,
        fontWeight: FontWeight.w500,
      );

  static TextTheme getTextTheme() => _poppinsTextTheme.copyWith(
        bodyText1: _bodyText1,
        button: _buttonText,
        subtitle1: _subtitle1Text,
        headline1: _headline1Text,
        headline2: _headline2Text,
      );
}
