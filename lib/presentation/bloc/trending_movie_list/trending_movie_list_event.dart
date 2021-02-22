part of 'trending_movie_list_bloc.dart';

abstract class TrendingMovieListEvent extends Equatable {
  const TrendingMovieListEvent();

  @override
  List<Object> get props => [];
}

class TrendingMovieListLoadEvent extends TrendingMovieListEvent {}
