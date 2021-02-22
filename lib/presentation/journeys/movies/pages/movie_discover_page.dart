import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/di/get_di.dart';
import 'package:movie_db/presentation/bloc/movie_carousel/movie_carousel_bloc.dart';

import 'component/movie_carousel_widget.dart';

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
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.6,
                      child: MovieCarouselWidget(
                        movies: state.movies,
                        defaultIndex: state.defaultIndex,
                      ),
                    ),
                    FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.4,
                      child: Container(),
                    ),
                  ],
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
