// Flutter imports:
import 'package:flutter/widgets.dart';

class NavigationItem {
  final IconData icon;
  final String label;
  final bool isSelected;

  NavigationItem({
    this.icon,
    this.label,
    this.isSelected = false,
  });
}
