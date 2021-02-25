// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:movie_db/core/core.dart';
import 'package:movie_db/features/movies/data/models/movie_models.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';
import 'package:movie_db/presentation/view_models/navigation_item.dart';
import 'package:movie_db/presentation/widgets/simple_carousel/simple_carousel.dart';
import 'package:movie_db/presentation/widgets/widgets.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CustomAppBar(
          child: Row(
            children: <Widget>[
              NavigationBar(
                axis: Axis.horizontal,
                navigationItems: const <NavigationItem>[
                  NavigationItem(
                    label: Strings.goBack,
                    icon: Icons.arrow_back,
                  )
                ],
                onTap: (int i) => BlocProvider.of<MovieRouteBloc>(context)
                    .add(MovieRouteToMainPageEvent()),
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (BuildContext context, MovieDetailsState state) {
            if (state is MovieDetailsLoaded) {
              final MovieDetails movieDetails = state.movieDetails;
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: Sizes.dimen_80),
                    SimpleCarousel(
                      contents: movieDetails.images.backdrops,
                    ),
                    Text(movieDetails.title),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      );
}
