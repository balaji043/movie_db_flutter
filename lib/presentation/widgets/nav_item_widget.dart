part of 'widgets.dart';

class NavItemWidget extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Function(int) onTap;
  final int selectedIndex;
  final int index;

  const NavItemWidget({
    @required this.label,
    @required this.onTap,
    @required this.selectedIndex,
    @required this.index,
    this.iconData,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomButton(
        title: label,
        onPressed: () => onTap(index),
        iconSrc: iconData,
        isActive: selectedIndex == index,
      );
}
