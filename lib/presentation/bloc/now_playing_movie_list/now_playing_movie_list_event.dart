part of 'now_playing_movie_list_bloc.dart';

abstract class NowPlayingMovieListEvent extends Equatable {
  const NowPlayingMovieListEvent();

  @override
  List<Object> get props => [];
}

class NowPlayingMovieListLoadEvent extends NowPlayingMovieListEvent {}
