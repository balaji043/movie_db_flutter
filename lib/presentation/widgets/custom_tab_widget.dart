import 'package:flutter/material.dart';
import 'package:movie_db/presentation/widgets/custom_button.dart';

class CustomTabWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final PageController controller;
  final int index;
  final int currentIndex;
  final Function(int) setCurrentIndex;

  const CustomTabWidget({
    @required this.index,
    @required this.controller,
    @required this.title,
    @required this.currentIndex,
    @required this.setCurrentIndex,
    this.iconData,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomButton(
        title: title,
        press: () {
          controller?.jumpToPage(index);
          setCurrentIndex(index);
        },
        iconSrc: iconData,
        isActive: currentIndex == index,
      );
}
