part of 'trending_movie_list_bloc.dart';

abstract class TrendingMovieListState extends Equatable {
  const TrendingMovieListState();

  @override
  List<Object> get props => [];
}

class TrendingMovieListInitial extends TrendingMovieListState {}

class TrendingMovieListError extends TrendingMovieListState {}

class TrendingMovieListSuccess extends TrendingMovieListState {
  final PaginatedResponse<MovieEntity> movies;

  const TrendingMovieListSuccess({
    @required this.movies,
  });

  @override
  List<Object> get props => <Object>[movies];
}
