part of 'movie_widgets.dart';

class PopularMovieListView extends StatelessWidget {
  final void Function(MovieEntity) onTap;

  const PopularMovieListView({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PopularMovieListBloc, PopularMovieListState>(
        builder: (BuildContext context, PopularMovieListState state) {
          if (state is PopularMovieListSuccess) {
            return Container(
              padding: const EdgeInsets.all(Sizes.dimen_20),
              child: ContentListView<MovieEntity>(
                title: Strings.popular,
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
