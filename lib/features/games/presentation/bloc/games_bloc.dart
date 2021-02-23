import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'games_event.dart';
part 'games_state.dart';
class GamesBloc extends Bloc<GamesEvent, GamesState> {
  GamesBloc() : super(GamesInitial());
  @override
  Stream<GamesState> mapEventToState(
    GamesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
