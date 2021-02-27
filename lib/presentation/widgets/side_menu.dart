part of 'widgets.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 300,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              color: AppColor.inactiveWhite,
            ),
          ),
          color: AppColor.black,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.dimen_40,
            bottom: Sizes.dimen_32,
            left: Sizes.dimen_20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Column>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(bottom: Sizes.dimen_10),
                    child: Logo(height: Sizes.dimen_32),
                  ),
                  BlocBuilder<HomeRouteCubit, int>(
                    builder: (BuildContext context, int state) => NavigationBar(
                      navigationItems: navigationItems,
                      axis: Axis.vertical,
                      selectedIndex: state,
                      onTap: (int i) {
                        context.read<HomeRouteCubit>().changeIndex(i);
                        if (scaffoldKey.currentState.isDrawerOpen) {
                          scaffoldKey.currentState.openEndDrawer();
                        }
                      },
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  CustomButton(
                    onPressed: () {},
                    iconSrc: Icons.list,
                    title: Strings.myLists,
                  ),
                  CustomButton(
                    onPressed: () {},
                    iconSrc: Icons.settings,
                    title: Strings.settings,
                  ),
                  CustomButton(
                    onPressed: () {},
                    iconSrc: Icons.person,
                    title: 'balaji043',
                  ),
                ],
              )
            ],
          ),
        ),
      );
}

List<NavigationItem> navigationItems = const <NavigationItem>[
  NavigationItem(
    isSelected: true,
    icon: Icons.movie,
    label: Strings.movies,
  ),
  NavigationItem(
    icon: Icons.tv,
    label: Strings.tvShows,
  ),
  NavigationItem(
    icon: Icons.games,
    label: Strings.games,
  ),
  NavigationItem(
    icon: Icons.people,
    label: Strings.people,
  ),
];
