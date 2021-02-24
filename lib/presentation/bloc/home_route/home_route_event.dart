part of 'home_route_bloc.dart';

abstract class HomeRouteEvent extends Equatable {
  const HomeRouteEvent();

  @override
  List<Object> get props => [];
}

class HomeRouteChangeEvent extends HomeRouteEvent {
  final int index;

  const HomeRouteChangeEvent(this.index);
  @override
  List<Object> get props => [index];
}
