import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/di/get_di.dart';
import 'package:movie_db/presentation/bloc/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_db/presentation/widgets/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc movieCarouselBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance.get();
    movieCarouselBloc.add(const MovieCarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCarouselBloc>(
      create: (context) => movieCarouselBloc,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              heightFactor: 0.6,
              alignment: Alignment.topCenter,
              child: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
                builder: (context, state) {
                  if (state is MovieCarouselSuccess) {
                    return MovieCarouselWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    );
                  }
                  return SizedBox.fromSize();
                },
              ),
            ),
            const FractionallySizedBox(
              heightFactor: 0.4,
              alignment: Alignment.bottomCenter,
              child: Placeholder(),
            )
          ],
        ),
      ),
    );
  }
}
