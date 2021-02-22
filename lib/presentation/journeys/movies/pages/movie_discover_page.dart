import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/di/get_di.dart';
import 'package:movie_db/presentation/bloc/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_db/presentation/widgets/carousel_with_list_tile_widget.dart';

class MovieDiscoverPage extends StatefulWidget {
  const MovieDiscoverPage({Key key}) : super(key: key);

  @override
  _MovieDiscoverPageState createState() => _MovieDiscoverPageState();
}

class _MovieDiscoverPageState extends State<MovieDiscoverPage> {
  MovieCarouselBloc movieCarouselBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieCarouselBloc.add(const MovieCarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc.close();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<MovieCarouselBloc>(
            create: (BuildContext context) => movieCarouselBloc,
          ),
        ],
        child: Scaffold(
          body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
            builder: (BuildContext context, MovieCarouselState state) {
              if (state is MovieCarouselSuccess) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Sizes.dimen_20),
                  child: ListView(
                    children: <Widget>[
                      CarouselWithListTileWidget(
                        contents: state.movies.results,
                      ),
                      const SizedBox(height: Sizes.dimen_20),
                      Container(
                        height: 400,
                        child: const Placeholder(),
                      ),
                    ],
                  ),
                );
              } else if (state is MovieCarouselError) {
                return Container();
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      );
}
