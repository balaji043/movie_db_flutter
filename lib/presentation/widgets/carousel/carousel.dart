import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/domain/entities/ui_params.dart';

import 'carousel_side_list.dart';

class Caraousel<C extends Cubit<S>, S> extends StatelessWidget {
  final List<UIParam> contents;
  final BlocWidgetBuilder<S> carouselCardBuilder;
  final ListItemBuilder<S> listItemBuilder;
  final void Function(UIParam) onTap;

  const Caraousel({
    @required this.contents,
    @required this.carouselCardBuilder,
    @required this.onTap,
    @required this.listItemBuilder,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(Sizes.dimen_20),
        height: 540,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.dimen_16),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: <FractionallySizedBox>[
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.8,
                child: BlocBuilder<C, S>(
                  builder: carouselCardBuilder,
                ),
              ),
              FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: 0.2,
                child: SideList<C, S>(
                  contents: contents,
                  onTap: onTap,
                  listItemBuilder: listItemBuilder,
                ),
              )
            ],
          ),
        ),
      );
}
