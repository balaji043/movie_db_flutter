part of 'movie_route_bloc.dart';

abstract class MovieRouteState extends Equatable {
  const MovieRouteState();

  @override
  List<Object> get props => [];
}

class MovieRouteToMainPageState extends MovieRouteState {}

class MovieRouteToDetailsPageState extends MovieRouteState {
  final MovieEntity movie;

  const MovieRouteToDetailsPageState(this.movie);
  @override
  List<Object> get props => [movie];
}
