part of 'movie_tab_route_bloc.dart';

abstract class MovieTabRouteState extends Equatable {
  const MovieTabRouteState();

  @override
  List<Object> get props => <Object>[];
}

class MovieTabRouteInitial extends MovieTabRouteState {
  @override
  List<Object> get props => <Object>[];
}

class MovieTabRouteChangedState extends MovieTabRouteState {
  final int index;

  const MovieTabRouteChangedState(this.index);

  @override
  List<Object> get props => <Object>[index];
}
