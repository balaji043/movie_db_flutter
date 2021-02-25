// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/domain/entities/ui_params.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';
import 'package:movie_db/presentation/widgets/carousel/carousel.dart';
import 'package:movie_db/presentation/widgets/carousel/carousel_card.dart';
import 'package:movie_db/presentation/widgets/carousel/carousel_side_list_item.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
        builder: (BuildContext context, MovieCarouselState state) {
          if (state is MovieCarouselSuccess) {
            return Caraousel<MovieCarouselCardBloc, MovieCarouselCardState>(
              carouselCardBuilder: (
                BuildContext context,
                MovieCarouselCardState state,
              ) {
                if (state is MovieCarouselCardChange) {
                  return CarouselCard(
                    content: state.movie,
                  );
                }
                return Container();
              },
              contents: state.movies.results,
              listItemBuilder: (
                BuildContext context,
                MovieCarouselCardState state,
                UIParam content,
              ) {
                if (state is MovieCarouselCardChange) {
                  return ListItem(
                    content: content,
                    selected: state.movie.dId == content.dId,
                  );
                }
                return Container();
              },
              onTap: (UIParam content) =>
                  BlocProvider.of<MovieCarouselCardBloc>(context)
                      .add(MovieCarouselCardChangedEvent(content)),
            );
          } else {
            return Container();
          }
        },
      );
}
