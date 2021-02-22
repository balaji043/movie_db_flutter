import 'package:flutter/material.dart';
import 'package:movie_db/presentation/widgets/custom_button.dart';

class NavItem extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Function(int) onTap;
  final int selectedIndex;
  final int index;

  const NavItem({
    @required this.label,
    this.iconData,
    Key key,
    this.onTap,
    this.selectedIndex,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomButton(
        title: label,
        press: () => onTap(index),
        iconSrc: iconData,
        isActive: selectedIndex == index,
      );
}
