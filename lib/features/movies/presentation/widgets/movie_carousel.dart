part of 'movie_widgets.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
        builder: (BuildContext context, MovieCarouselState state) {
          if (state is MovieCarouselSuccess) {
            return Caraousel<MovieCarouselCardBloc, MovieCarouselCardState>(
              carouselCardBuilder: (
                BuildContext context,
                MovieCarouselCardState state,
              ) {
                if (state is MovieCarouselCardChange) {
                  return CarouselCard(
                    content: state.movie,
                  );
                }
                return Container();
              },
              contents: state.movies,
              onTap: (UIParam content) =>
                  BlocProvider.of<MovieCarouselCardBloc>(context)
                      .add(MovieCarouselCardChangedEvent(content)),
            );
          } else {
            return Container();
          }
        },
      );
}
