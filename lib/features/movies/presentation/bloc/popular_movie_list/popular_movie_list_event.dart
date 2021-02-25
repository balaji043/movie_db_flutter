part of 'popular_movie_list_bloc.dart';

abstract class PopularMovieListEvent extends Equatable {
  const PopularMovieListEvent();

  @override
  List<Object> get props => <Object>[];
}

class PopularMovieListLoadEvent extends PopularMovieListEvent {}
