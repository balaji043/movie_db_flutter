import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';
import 'package:movie_db/presentation/widgets/content_list_view.dart';

class UpcomingMovieListView extends StatelessWidget {
  const UpcomingMovieListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UpcomingMovieListBloc, UpcomingMovieListState>(
        builder: (BuildContext context, UpcomingMovieListState state) {
          if (state is UpcomingMovieListSuccess) {
            return Container(
              padding: const EdgeInsets.all(Sizes.dimen_20),
              child: ContentListView(
                contents: state.movies.results,
                title: 'Upcoming',
              ),
            );
          } else if (state is MovieCarouselError) {
            return Container();
          }
          return const SizedBox.shrink();
        },
      );
}
