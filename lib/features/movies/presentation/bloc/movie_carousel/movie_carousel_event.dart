part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object> get props => <Object>[];
}

class MovieCarouselLoadEvent extends MovieCarouselEvent {
  final int defaultIndex;

  const MovieCarouselLoadEvent({this.defaultIndex = 0});
}
