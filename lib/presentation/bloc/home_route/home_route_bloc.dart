// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_route_event.dart';
part 'home_route_state.dart';

class HomeRouteBloc extends Bloc<HomeRouteEvent, HomeRouteState> {
  HomeRouteBloc() : super(HomeRouteInitial());

  @override
  Stream<HomeRouteState> mapEventToState(
    HomeRouteEvent event,
  ) async* {
    if (event is HomeRouteChangeEvent) {
      yield HomeRouteChangeState(event.index);
    }
  }
}
