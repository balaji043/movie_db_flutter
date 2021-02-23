import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';
import 'package:movie_db/presentation/widgets/custom_app_bar.dart';

class MovieDetailsPage extends StatelessWidget {
  final MovieEntity movie;

  const MovieDetailsPage({
    @required this.movie,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CustomAppBar(child: Container()),
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            return Container();
          },
        ),
      );
}
