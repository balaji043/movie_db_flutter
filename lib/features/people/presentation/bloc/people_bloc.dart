import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'people_event.dart';
part 'people_state.dart';
class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  PeopleBloc() : super(PeopleInitial());
  @override
  Stream<PeopleState> mapEventToState(
    PeopleEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
