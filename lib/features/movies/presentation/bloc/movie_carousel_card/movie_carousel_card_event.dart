part of 'movie_carousel_card_bloc.dart';

abstract class MovieCarouselCardEvent extends Equatable {
  const MovieCarouselCardEvent();

  @override
  List<Object> get props => [];
}

class MovieCarouselCardChangedEvent extends MovieCarouselCardEvent {
  final MovieEntity movie;

  const MovieCarouselCardChangedEvent(this.movie);

  @override
  List<Object> get props => [movie];
}
