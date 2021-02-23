part of 'top_rated_movie_list_bloc.dart';

abstract class TopRatedMovieListState extends Equatable {
  const TopRatedMovieListState();

  @override
  List<Object> get props => [];
}

class TopRatedMovieListInitial extends TopRatedMovieListState {}

class TopRatedMovieListError extends TopRatedMovieListState {}

class TopRatedMovieListSuccess extends TopRatedMovieListState {
  final PaginatedResponse<MovieEntity> movies;

  const TopRatedMovieListSuccess({
    @required this.movies,
  });
  @override
  List<Object> get props => <Object>[movies];
}
