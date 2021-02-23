import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';

part 'movie_route_event.dart';
part 'movie_route_state.dart';

class MovieRouteBloc extends Bloc<MovieRouteEvent, MovieRouteState> {
  MovieRouteBloc() : super(MovieRouteToMainPageState());

  @override
  Stream<MovieRouteState> mapEventToState(
    MovieRouteEvent event,
  ) async* {
    if (event is MovieRouteToDetailsPageEvent) {
      yield MovieRouteToDetailsPageState(event.movie);
    }
    if (event is MovieRouteToMainPageEvent) {
      yield MovieRouteToMainPageState();
    }
  }
}

enum MovieRoute { main, details }
