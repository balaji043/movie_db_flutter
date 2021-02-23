part of 'popular_movie_list_bloc.dart';

abstract class PopularMovieListState extends Equatable {
  const PopularMovieListState();

  @override
  List<Object> get props => [];
}

class PopularMovieListInitial extends PopularMovieListState {}

class PopularMovieListError extends PopularMovieListState {}

class PopularMovieListSuccess extends PopularMovieListState {
  final PaginatedResponse<MovieEntity> movies;

  const PopularMovieListSuccess({
    @required this.movies,
  });
  @override
  List<Object> get props => <Object>[movies];
}
