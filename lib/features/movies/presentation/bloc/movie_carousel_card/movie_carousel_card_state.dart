part of 'movie_carousel_card_bloc.dart';

abstract class MovieCarouselCardState extends Equatable {
  const MovieCarouselCardState();

  @override
  List<Object> get props => [];
}

class MovieCarouselCardInitial extends MovieCarouselCardState {}

class MovieCarouselCardChange extends MovieCarouselCardState {
  final MovieEntity movie;

  const MovieCarouselCardChange(this.movie);

  @override
  List<Object> get props => [movie];
}
