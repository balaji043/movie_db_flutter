// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/core.dart';

// Project imports:
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/domain/entities/entities.dart';
import 'package:movie_db/presentation/themes/themes.dart';
import 'package:movie_db/presentation/widgets/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

part 'carousel_card.dart';
part 'carousel_side_list.dart';
part 'carousel_side_list_item.dart';

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
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isMobile = Responsive.isMobile(context);
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(Sizes.dimen_20),
      height: isDesktop
          ? size.height * 0.8
          : isTablet
              ? size.height * 0.6
              : size.height * 0.4,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.dimen_16),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <FractionallySizedBox>[
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: !isMobile ? 0.8 : 1,
              child: BlocBuilder<C, S>(
                builder: carouselCardBuilder,
              ),
            ),
            if (!isMobile)
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
}
