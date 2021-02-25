import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/core.dart';
import 'package:movie_db/domain/entities/entities.dart';

import 'package:movie_db/features/movies/domain/entities/movie_entities.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';
import 'package:movie_db/presentation/journeys/home/home_screen.dart';
import 'package:movie_db/presentation/view_models/navigation_item.dart';
import 'package:movie_db/presentation/widgets/carousel/carousel.dart';
import 'package:movie_db/presentation/widgets/widgets.dart';

// part 'movie_app_bar.dart';
part 'movie_carousel.dart';
part 'now_playing_movies.dart';
part 'popular_movies_list.dart';
part 'top_rated_movies.dart';
part 'upcoming_movies.dart';
part 'movie_app_bar.dart';
