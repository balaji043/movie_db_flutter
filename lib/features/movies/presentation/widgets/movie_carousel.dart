// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';

// Package imports:
import 'package:transparent_image/transparent_image.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/domain/entities/ui_params.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
        builder: (BuildContext context, MovieCarouselState state) {
          if (state is MovieCarouselSuccess) {
            return Container(
              padding: const EdgeInsets.all(Sizes.dimen_20),
              height: 540,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(Sizes.dimen_16),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: <FractionallySizedBox>[
                    const FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.8,
                      child: CarouselCard(),
                    ),
                    FractionallySizedBox(
                      alignment: Alignment.centerRight,
                      widthFactor: 0.2,
                      child: _SideListView(
                        contents: state.movies.results,
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (state is MovieCarouselError) {
            return Container();
          }
          return const SizedBox.shrink();
        },
      );
}

class _SideListView extends StatelessWidget {
  final List<MovieEntity> contents;

  const _SideListView({
    @required this.contents,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemExtent: 100,
        itemBuilder: (BuildContext context, int index) {
          final MovieEntity content = contents[index];
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => {
              BlocProvider.of<MovieCarouselCardBloc>(context).add(
                MovieCarouselCardChangedEvent(content),
              )
            },
            child: _ListItem(
              content: content,
            ),
          );
        },
        itemCount: contents?.length ?? 0,
      );
}

class CarouselCard<T extends UIParam> extends StatelessWidget {
  const CarouselCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieCarouselCardBloc, MovieCarouselCardState>(
        builder: (BuildContext context, MovieCarouselCardState state) {
          if (state is MovieCarouselCardChange) {
            final TextTheme textTheme = Theme.of(context).textTheme;
            final content = state.movie;
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: Stack(
                key: ValueKey<String>(content.id.toString()),
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.centerRight,
                    widthFactor: 1,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: getBDUrl(content.dBackdropPath, ImageUrl.w1280),
                      fit: BoxFit.fill,
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.3,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: AppColor.black.withOpacity(0.3),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                content.dTitle ?? '',
                                style: textTheme.headline4.copyWith(
                                  color: AppColor.white,
                                ),
                                maxLines: 3,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                content.dOverview ?? '',
                                style: textTheme.subtitle1
                                    .copyWith(color: AppColor.white),
                                maxLines: 12,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      );
}

class _ListItem extends StatelessWidget {
  final MovieEntity content;
  const _ListItem({
    @required this.content,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieCarouselCardBloc, MovieCarouselCardState>(
        builder: (BuildContext context, MovieCarouselCardState state) {
          if (state is MovieCarouselCardChange) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: Container(
                key: ValueKey<String>(content.id.toString()),
                padding: const EdgeInsets.all(Sizes.dimen_12),
                color:
                    state.movie == content ? AppColor.black2 : AppColor.black,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 76,
                      width: 56,
                      child: FadeInImage.memoryNetwork(
                        image: getBDUrl(content.dPosterPath, ImageUrl.w154),
                        placeholder: kTransparentImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(width: Sizes.dimen_12),
                    Expanded(
                      child: Text(
                        content.dTitle,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: AppColor.white,
                            ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      );
}
