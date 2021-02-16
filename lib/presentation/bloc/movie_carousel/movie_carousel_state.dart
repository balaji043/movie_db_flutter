part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => <Object>[];
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselError extends MovieCarouselState {}

class MovieCarouselSuccess extends MovieCarouselState {
  final PaginatedResponse<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselSuccess({
    @required this.movies,
    @required this.defaultIndex,
  }) : assert(defaultIndex >= 0, 'default index cannot be less than 0');
}
