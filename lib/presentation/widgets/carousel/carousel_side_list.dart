import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/domain/entities/ui_params.dart';

class SideList<C extends Cubit<S>, S> extends StatelessWidget {
  final List<UIParam> contents;
  final ListItemBuilder<S> listItemBuilder;

  final void Function(UIParam) onTap;

  const SideList({
    @required this.contents,
    @required this.onTap,
    @required this.listItemBuilder,
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
            child: BlocBuilder<C, S>(
              builder: (BuildContext context, S state) => listItemBuilder(
                context,
                state,
                content,
              ),
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
