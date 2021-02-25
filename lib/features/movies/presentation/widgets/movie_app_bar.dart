part of 'movie_widgets.dart';

class MovieAppBar extends StatefulWidget {
  final List<NavigationItem> navigationItems;

  const MovieAppBar({
    @required this.navigationItems,
    Key key,
  }) : super(key: key);

  @override
  _MovieAppBarState createState() => _MovieAppBarState();
}

class _MovieAppBarState extends State<MovieAppBar> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieTabRouteBloc, MovieTabRouteState>(builder: (
        BuildContext context,
        MovieTabRouteState state,
      ) {
        int currentIndex = 0;
        if (state is MovieTabRouteChangedState) {
          currentIndex = state.index;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: Sizes.dimen_20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  for (int i = 0; i < widget.navigationItems.length; i++)
                    NavItemWidget(
                      selectedIndex: currentIndex,
                      iconData: widget.navigationItems[i].icon,
                      label: widget.navigationItems[i].label,
                      index: i,
                      onTap: onTapOfNavItem,
                    )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                NavItemWidget(
                  selectedIndex: currentIndex,
                  label: 'My Wishlist',
                  index: 2,
                  onTap: onTapOfNavItem,
                ),
                const SizedBox(width: Sizes.dimen_12),
                const SearchBar()
              ],
            )
          ],
        );
      });

  void onTapOfNavItem(int i) {
    BlocProvider.of<MovieTabRouteBloc>(context)
        .add(MovieTabRouteChangeEvent(i));
    final bool isDrawerOpen = scaffoldKey.currentState.isDrawerOpen;
    if (isDrawerOpen) {
      Navigator.pop(scaffoldKey.currentContext);
    }
  }
}
