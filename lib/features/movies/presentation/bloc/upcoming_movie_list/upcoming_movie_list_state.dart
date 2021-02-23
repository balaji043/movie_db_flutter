part of 'upcoming_movie_list_bloc.dart';

abstract class UpcomingMovieListState extends Equatable {
  const UpcomingMovieListState();

  @override
  List<Object> get props => [];
}

class UpcomingMovieListInitial extends UpcomingMovieListState {}

class UpcomingMovieListError extends UpcomingMovieListState {}

class UpcomingMovieListSuccess extends UpcomingMovieListState {
  final PaginatedResponse<MovieEntity> movies;

  const UpcomingMovieListSuccess({
    @required this.movies,
  });
  @override
  List<Object> get props => <Object>[movies];
}
