part of 'upcoming_movie_list_bloc.dart';

abstract class UpcomingMovieListEvent extends Equatable {
  const UpcomingMovieListEvent();

  @override
  List<Object> get props => <Object>[];
}

class UpcomingMovieListLoadEvent extends UpcomingMovieListEvent {}

class UpcomingMovieListLoadMoreEvent extends UpcomingMovieListEvent {}
