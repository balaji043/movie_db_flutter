part of 'home_route_bloc.dart';

abstract class HomeRouteState extends Equatable {
  const HomeRouteState();

  @override
  List<Object> get props => <Object>[];
}

class HomeRouteInitial extends HomeRouteState {}

class HomeRouteChangeState extends HomeRouteState {
  final int index;

  const HomeRouteChangeState(this.index);
  @override
  List<Object> get props => <Object>[index];
}
