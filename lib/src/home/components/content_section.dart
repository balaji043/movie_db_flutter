// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:movie_db/domain/entities/movie_entity.dart';
import 'package:movie_db/src/app_colors.dart';
import 'package:movie_db/src/components/movie_card.dart';

class Content {
  final String name;
  final RxList<MovieEntity> movies;

  Content({
    @required this.name,
    @required this.movies,
  });
}

class ContentSection extends StatefulWidget {
  final String title;
  final List<Content> contents;

  const ContentSection({
    @required this.title,
    @required this.contents,
    Key key,
  }) : super(key: key);

  @override
  _ContentSectionState createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Container(
        height: 410,
        margin: const EdgeInsets.all(20),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(0, 45),
            child: _ContentBar(
              onPressed: _onOptionPressed,
              title: widget.title,
              selectedIndex: selectedIndex,
              contents: widget.contents,
            ),
          ),
          body: SafeArea(
            child: Obx(
              () => ListView.separated(
                padding: const EdgeInsets.only(top: kDefaultPadding),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 10),
                scrollDirection: Axis.horizontal,
                itemCount: widget.contents[selectedIndex].movies.length,
                itemBuilder: (BuildContext context, int index) {
                  final MovieEntity dataContent = widget?.contents
                      ?.elementAt(selectedIndex)
                      ?.movies
                      ?.elementAt(index);
                  return MovieCardWidget(
                    posterPath: dataContent.posterPath,
                    releaseDate: dataContent.releaseDate,
                    title: dataContent.title,
                    voteAverage:
                        (dataContent?.voteAverage ?? 0 * 10).toString(),
                  );
                },
              ),
            ),
          ),
        ),
      );

  void _onOptionPressed(int i) {
    if (i == selectedIndex) {
      return;
    }
    setState(() => selectedIndex = i);
  }
}

class _ContentBar extends StatelessWidget {
  final String title;
  final int selectedIndex;
  final List<Content> contents;
  final Function(int) onPressed;

  const _ContentBar({
    @required this.contents,
    @required this.title,
    @required this.selectedIndex,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 45,
              child: ListView(
                padding: const EdgeInsets.only(top: 2, bottom: 8),
                scrollDirection: Axis.horizontal,
                children: contents
                    .asMap()
                    .map(
                      (int i, Content element) => MapEntry<int, SizedBox>(
                        i,
                        SizedBox(
                          height: 35,
                          width: 100,
                          child: RawMaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            fillColor:
                                i == selectedIndex ? kPrimaryColor : null,
                            onPressed: () => onPressed(i),
                            child: Text(
                              element.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: i == selectedIndex
                                    ? kSecondaryColor
                                    : kTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
            ),
          ),
        ],
      );
}
