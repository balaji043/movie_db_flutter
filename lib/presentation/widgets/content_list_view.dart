import 'package:flutter/material.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/domain/entities/ui_params.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';
import 'package:movie_db/presentation/widgets/content_card.dart';

class ContentListView<T extends UIParam> extends StatelessWidget {
  final List<T> contents;
  final String title;
  const ContentListView({
    @required this.contents,
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 430,
        child: ListView(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: AppColor.white,
                  ),
              maxLines: 1,
            ),
            const SizedBox(
              height: Sizes.dimen_12,
            ),
            Container(
              height: 380,
              child: ListView(
                itemExtent: 200,
                scrollDirection: Axis.horizontal,
                children: contents
                    .map(
                      (content) => ContentCard(content: content),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
}
