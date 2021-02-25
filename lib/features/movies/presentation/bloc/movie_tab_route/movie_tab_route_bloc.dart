// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_tab_route_event.dart';
part 'movie_tab_route_state.dart';

class MovieTabRouteBloc extends Bloc<MovieTabRouteEvent, MovieTabRouteState> {
  final PageController _controller;

  MovieTabRouteBloc(this._controller) : super(MovieTabRouteInitial());

  @override
  Stream<MovieTabRouteState> mapEventToState(
    MovieTabRouteEvent event,
  ) async* {
    if (event is MovieTabRouteChangeEvent) {
      if (_controller.page == event.i) {
        return;
      }
      _controller.jumpToPage(event.i);
      yield MovieTabRouteChangedState(event.i);
    }
  }
}

enum MovieTab { discover, browse, myWishList }
