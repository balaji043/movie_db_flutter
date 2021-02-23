import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'tv_shows_event.dart';
part 'tv_shows_state.dart';
class TvShowsBloc extends Bloc<TvShowsEvent, TvShowsState> {
  TvShowsBloc() : super(TvShowsInitial());
  @override
  Stream<TvShowsState> mapEventToState(
    TvShowsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
