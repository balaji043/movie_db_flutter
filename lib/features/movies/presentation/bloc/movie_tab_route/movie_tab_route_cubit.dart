// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Package imports:

class MovieTabRouteCubit extends Cubit<int> {
  final PageController _controller;

  MovieTabRouteCubit(this._controller) : super(0);

  void changeIndex(int index) {
    if (_controller.page == index) {
      return;
    }
    _controller.jumpToPage(index);
    emit(index);
  }
}
