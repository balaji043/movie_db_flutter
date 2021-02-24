import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_route_event.dart';
part 'home_route_state.dart';

class HomeRouteBloc extends Bloc<HomeRouteEvent, HomeRouteState> {
  final PageController _controller;

  HomeRouteBloc(this._controller) : super(HomeRouteInitial());

  @override
  Stream<HomeRouteState> mapEventToState(
    HomeRouteEvent event,
  ) async* {
    if (event is HomeRouteChangeEvent) {
      if (_controller.page == event.index) {
        return;
      }
      _controller.jumpToPage(event.index);
      yield HomeRouteChangeState(event.index);
    }
  }
}
