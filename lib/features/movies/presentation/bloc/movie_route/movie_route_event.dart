part of 'movie_route_bloc.dart';

abstract class MovieRouteEvent extends Equatable {
  const MovieRouteEvent();

  @override
  List<Object> get props => [];
}

class MovieRouteToMainPageEvent extends MovieRouteEvent {}

class MovieRouteToDetailsPageEvent extends MovieRouteEvent {
  final MovieEntity movie;

  const MovieRouteToDetailsPageEvent(this.movie);
  @override
  List<Object> get props => [movie];
}
