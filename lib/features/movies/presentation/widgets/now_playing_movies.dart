import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';
import 'package:movie_db/presentation/widgets/content_list_view.dart';

class NowPlayingMovieListView extends StatelessWidget {
  const NowPlayingMovieListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<NowPlayingMovieListBloc, NowPlayingMovieListState>(
        builder: (BuildContext context, NowPlayingMovieListState state) {
          if (state is NowPlayingMovieListSuccess) {
            return Container(
              padding: const EdgeInsets.all(Sizes.dimen_20),
              child: ContentListView(
                contents: state.movies.results,
                title: 'Now Playing',
              ),
            );
          } else if (state is MovieCarouselError) {
            return Container();
          }
          return const SizedBox.shrink();
        },
      );
}
