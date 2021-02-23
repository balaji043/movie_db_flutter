// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:movie_db/presentation/view_models/navigation_item.dart';
import 'nav_item_widget.dart';

class NavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Axis axis;
  final List<NavigationItem> navigationItems;
  final Function(int) onTap;

  const NavigationBar({
    this.selectedIndex,
    this.axis,
    this.navigationItems,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) => ListView(
        scrollDirection: widget.axis,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <NavItemWidget>[
          for (int i = 0; i < widget.navigationItems.length; i++)
            NavItemWidget(
              selectedIndex: widget.selectedIndex,
              iconData: widget.navigationItems[i].icon,
              label: widget.navigationItems[i].label,
              index: i,
              onTap: widget.onTap,
            ),
        ],
      );
}
