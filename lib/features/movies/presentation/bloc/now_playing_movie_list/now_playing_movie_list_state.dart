part of 'now_playing_movie_list_bloc.dart';

abstract class NowPlayingMovieListState extends Equatable {
  const NowPlayingMovieListState();

  @override
  List<Object> get props => [];
}

class NowPlayingMovieListInitial extends NowPlayingMovieListState {}

class NowPlayingMovieListError extends NowPlayingMovieListState {}

class NowPlayingMovieListSuccess extends NowPlayingMovieListState {
  final PaginatedResponse<MovieEntity> movies;

  const NowPlayingMovieListSuccess({
    @required this.movies,
  });
  @override
  List<Object> get props => <Object>[movies];
}
