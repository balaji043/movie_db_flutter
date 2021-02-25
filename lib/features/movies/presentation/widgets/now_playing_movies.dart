part of 'movie_widgets.dart';

class NowPlayingMovieListView extends StatelessWidget {
  final void Function(MovieEntity) onTap;

  const NowPlayingMovieListView({
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<NowPlayingMovieListBloc, NowPlayingMovieListState>(
        builder: (BuildContext context, NowPlayingMovieListState state) {
          if (state is NowPlayingMovieListSuccess) {
            return Container(
              padding: const EdgeInsets.all(Sizes.dimen_20),
              child: ContentListView<MovieEntity>(
                title: Strings.nowPlaying,
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
