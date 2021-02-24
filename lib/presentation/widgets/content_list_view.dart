// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/domain/entities/ui_params.dart';
import 'package:movie_db/presentation/widgets/content_card.dart';

class ContentListView extends StatelessWidget {
  final List<UIParam> contents;
  final String title;
  final void Function(UIParam) onTap;

  const ContentListView({
    @required this.onTap,
    @required this.contents,
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Container(
          height: 430,
          child: ListView(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
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
                        (content) => ContentCard(
                          content: content,
                          onTap: () => onTap(content),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
}
