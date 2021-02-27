// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:movie_db/core/core.dart';

class MovieTabRouteCubit extends IndexedCubit {
  final PageController _controller;

  MovieTabRouteCubit(this._controller);

  @override
  void changeIndex(int index) {
    if (_controller.page == index) {
      return;
    }
    _controller.jumpToPage(index);
    emit(index);
  }
}
