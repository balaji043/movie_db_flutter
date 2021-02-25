part of 'widgets.dart';

class ContentListView<T extends UIParam> extends StatelessWidget {
  final List<T> contents;
  final String title;
  final void Function(T) onTap;

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
            children: <Widget>[
              Text(
                title ?? '',
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
                        (T content) => ContentCard<T>(
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
