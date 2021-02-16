// Flutter imports:
import 'package:flutter/material.dart';

// All of our constant stuff

const Color kPrimaryColor = Color(0xFF366CF6);
const Color kSecondaryColor = Color(0xFFF5F6FC);
const Color kBgLightColor = Color(0xFFF2F4FC);
const Color kBgDarkColor = Color(0xFFEBEDFA);
const Color kBadgeColor = Color(0xFFEE376E);
const Color kGrayColor = Color(0xFF8793B2);
const Color kTitleTextColor = Color(0xFF30384D);
const Color kTextColor = Color(0xFF4D5875);

const double kDefaultPadding = 20;
const List<Color> colors = <Color>[
  Color(0xffc0fecf),
  Color(0xff1ed5a9),
];
final Shader linearGradient = const LinearGradient(
  colors: colors,
).createShader(
  const Rect.fromLTWH(0, 0, 200, 70),
);
