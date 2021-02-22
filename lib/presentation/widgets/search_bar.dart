import 'package:flutter/material.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool active = false;
  @override
  Widget build(BuildContext context) => AnimatedContainer(
        width: active ? Sizes.dimen_200 : Sizes.dimen_40,
        height: Sizes.dimen_40,
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(active ? 5 : 50),
          color: AppColor.black2,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Sizes.dimen_16,
                  bottom: Sizes.dimen_8,
                ),
                child: active
                    ? TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle:
                              Theme.of(context).textTheme.bodyText1.copyWith(
                                    color: AppColor.inactiveWhite,
                                  ),
                          border: InputBorder.none,
                        ),
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: AppColor.white,
                            ),
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
