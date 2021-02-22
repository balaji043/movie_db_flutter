part of 'popular_movie_list_bloc.dart';

abstract class PopularMovieListEvent extends Equatable {
  const PopularMovieListEvent();

  @override
  List<Object> get props => [];
}

class PopularMovieListLoadEvent extends PopularMovieListEvent {}
