import 'package:flutter/material.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';
import 'package:movie_db/presentation/widgets/custom_tab_widget.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  PageController controller;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = PageController(keepPage: false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(Sizes.dimen_115),
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(right: Sizes.dimen_20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Row>[
                Row(
                  children: <CustomTabWidget>[
                    CustomTabWidget(
                      title: 'Browse',
                      controller: controller,
                      index: 0,
                      currentIndex: currentIndex,
                      setCurrentIndex: setCurrentIndex,
                    ),
                    CustomTabWidget(
                      title: 'Discover',
                      controller: controller,
                      index: 1,
                      currentIndex: currentIndex,
                      setCurrentIndex: setCurrentIndex,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CustomTabWidget(
                      title: 'Wishlist',
                      controller: controller,
                      index: 3,
                      currentIndex: currentIndex,
                      setCurrentIndex: setCurrentIndex,
                    ),
                    const SizedBox(
                      width: Sizes.dimen_14,
                    ),
                    const SearchBar()
                  ],
                ),
              ],
            ),
          ),
        ),
        body: PageView(
          controller: controller,
          children: const <Center>[
            Center(
              child: Text('Movie'),
            ),
            Center(
              child: Text('AS'),
            )
          ],
        ),
      );

  void setCurrentIndex(int index) => setState(() => currentIndex = index);
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool active = true;
  @override
  Widget build(BuildContext context) => AnimatedContainer(
        width: active ? Sizes.dimen_200 : Sizes.dimen_40,
        height: Sizes.dimen_40,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.black2,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Sizes.dimen_16,
                ),
                child: active
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: Theme.of(context).textTheme.subtitle1,
                          border: InputBorder.none,
                        ),
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    : null,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: active
                  ? IconButton(
                      icon: const Icon(Icons.close),
                      color: AppColor.inactiveWhite,
                      onPressed: () => setState(() => active = !active),
                    )
                  : IconButton(
                      color: AppColor.inactiveWhite,
                      icon: const Icon(Icons.search),
                      onPressed: () => setState(() => active = !active),
                    ),
            )
          ],
        ),
      );
}

// TextField(
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
