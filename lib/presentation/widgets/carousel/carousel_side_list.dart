part of 'carousel.dart';

class SideList<C extends Cubit<S>, S> extends StatelessWidget {
  final List<UIParam> contents;

  final void Function(UIParam) onTap;

  const SideList({
    @required this.contents,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemExtent: 100,
        itemBuilder: (BuildContext context, int index) {
          final UIParam content = contents[index];
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(content),
            child: ListItem(
              content: contents[index],
            ),
          );
        },
        itemCount: contents?.length ?? 0,
      );
}

typedef ListItemBuilder<S> = Widget Function(
  BuildContext context,
  S state,
  UIParam content,
);
