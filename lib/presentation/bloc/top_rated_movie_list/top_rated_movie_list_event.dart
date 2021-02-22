part of 'top_rated_movie_list_bloc.dart';

abstract class TopRatedMovieListEvent extends Equatable {
  const TopRatedMovieListEvent();

  @override
  List<Object> get props => [];
}

class TopRatedMovieListLoadEvent extends TopRatedMovieListEvent {}
