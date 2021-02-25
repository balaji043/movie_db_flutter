part of 'movie_widgets.dart';

class UpcomingMovieListView extends StatelessWidget {
  final void Function(MovieEntity) onTap;

  const UpcomingMovieListView({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UpcomingMovieListBloc, UpcomingMovieListState>(
        builder: (BuildContext context, UpcomingMovieListState state) {
          if (state is UpcomingMovieListSuccess) {
            return Container(
              padding: const EdgeInsets.all(Sizes.dimen_20),
              child: ContentListView<MovieEntity>(
                contents: state.movies.results,
                title: Strings.upComing,
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
