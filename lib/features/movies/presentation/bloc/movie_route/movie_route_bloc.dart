import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_db/features/movies/presentation/bloc/movie_details/movie_details_bloc.dart';

part 'movie_route_event.dart';
part 'movie_route_state.dart';

class MovieRouteBloc extends Bloc<MovieRouteEvent, MovieRouteState> {
  final MovieDetailsBloc _movieDetailsBloc;

  MovieRouteBloc(this._movieDetailsBloc) : super(MovieRouteToMainPageState());

  @override
  Stream<MovieRouteState> mapEventToState(
    MovieRouteEvent event,
  ) async* {
    if (event is MovieRouteToDetailsPageEvent) {
      _movieDetailsBloc.add(MovieDetailLoadEvent(event.movie.id));
      yield MovieRouteToDetailsPageState(event.movie);
    }
    if (event is MovieRouteToMainPageEvent) {
      yield MovieRouteToMainPageState();
    }
  }
}

enum MovieRoute { main, details }
