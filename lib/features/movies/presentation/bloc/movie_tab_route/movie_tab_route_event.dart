part of 'movie_tab_route_bloc.dart';

abstract class MovieTabRouteEvent extends Equatable {
  const MovieTabRouteEvent();

  @override
  List<Object> get props => [];
}

class MovieTabRouteChangeEvent extends MovieTabRouteEvent {
  final int i;

  const MovieTabRouteChangeEvent(this.i);

  @override
  List<Object> get props => [i];
}
