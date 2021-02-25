part of 'movie_widgets.dart';

class TopRatedMovieListView extends StatelessWidget {
  final void Function(MovieEntity) onTap;

  const TopRatedMovieListView({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<TopRatedMovieListBloc, TopRatedMovieListState>(
        builder: (BuildContext context, TopRatedMovieListState state) {
          if (state is TopRatedMovieListSuccess) {
            return Container(
              padding: const EdgeInsets.all(Sizes.dimen_20),
              child: ContentListView<MovieEntity>(
                title: Strings.topRated,
                contents: state.movies.results,
                onTap: onTap,
              ),
            );
          } else if (state is MovieCarouselError) {
            return Container();
          }
          return const SizedBox.shrink();
        },
      );
}
