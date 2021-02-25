// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/data/core/strings.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';
import 'package:movie_db/presentation/widgets/content_list_view.dart';

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
