import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';

part 'movie_carousel_card_event.dart';
part 'movie_carousel_card_state.dart';

class MovieCarouselCardBloc
    extends Bloc<MovieCarouselCardEvent, MovieCarouselCardState> {
  MovieCarouselCardBloc() : super(MovieCarouselCardInitial());

  @override
  Stream<MovieCarouselCardState> mapEventToState(
    MovieCarouselCardEvent event,
  ) async* {
    if (event is MovieCarouselCardChangedEvent) {
      yield MovieCarouselCardChange(event.movie);
    }
  }
}
