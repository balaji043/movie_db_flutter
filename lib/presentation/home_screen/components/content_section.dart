import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_db/common/utils/app_colors.dart';
import 'package:movie_db/data/models/data_content.dart';
import 'package:movie_db/presentation/components/movie_card.dart';

class Content {
  final String name;
  final RxList<DataContent> movies;

  Content({@required this.name, @required this.movies});
}

class ContentSection extends StatefulWidget {
  final String title;
  final List<Content> contents;

  ContentSection({Key key, @required this.title, @required this.contents})
      : super(key: key);

  @override
  _ContentSectionState createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      margin: EdgeInsets.all(20),
      child: Container(
        child: Scaffold(
          appBar: _ContentBar(
            onPressed: onOptionPressed,
            title: widget.title,
            selectedIndex: selectedIndex,
            contents: widget.contents,
          ),
          body: SafeArea(
            child: Obx(
              () => ListView.separated(
                padding: const EdgeInsets.only(top: kDefaultPadding),
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: widget.contents[selectedIndex].movies.length,
                itemBuilder: (context, index) => MovieCardWidget(
                  dataContent: widget?.contents
                      ?.elementAt(selectedIndex)
                      ?.movies
                      ?.elementAt(index),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onOptionPressed(int i) {
    if (i == selectedIndex) return;
    setState(() => selectedIndex = i);
  }
}

class _ContentBar extends PreferredSize {
  final String title;
  final int selectedIndex;
  final List<Content> contents;
  final Function(int) onPressed;

  _ContentBar({
    @required this.contents,
    @required this.title,
    @required this.selectedIndex,
    @required this.onPressed,
  });

  @override
  final Size preferredSize = Size(0, 45);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Expanded(
          child: Container(
            height: 45,
            child: ListView(
              padding: const EdgeInsets.only(top: 2, bottom: 8),
              scrollDirection: Axis.horizontal,
              children: contents
                  .asMap()
                  .map(
                    (i, element) => MapEntry(
                      i,
                      Container(
                        height: 35,
                        width: 100,
                        child: RawMaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          fillColor: i == selectedIndex ? kPrimaryColor : null,
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
}
