import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/configuration_controller.dart';
import '../../controllers/movie_list_controller.dart';
import '../../controllers/tv_shows_controller.dart';

import 'components/content_section.dart';

class HomeScreen extends StatelessWidget {
  final configurationController = Get.put(ConfigurationController());
  final movieListController = Get.put(MovieListController());
  final tvShowsListController = Get.put(TVShowsListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _MovieContents(),
            _TVContents(),
          ],
        ),
      ),
    );
  }
}

class _MovieContents extends StatelessWidget {
  final MovieListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ContentSection(
      title: "Movies",
      contents: [
        Content(
          name: "Now Playing",
          movies: controller?.nowPlayingMovies,
        ),
        Content(
          name: "Popular",
          movies: controller?.popularMovies,
        ),
        Content(
          name: "Top Rated",
          movies: controller?.topRatedMovies,
        ),
        Content(
          name: "Upcoming",
          movies: controller?.upcomingMovies,
        ),
      ],
    );
  }
}

class _TVContents extends StatelessWidget {
  final TVShowsListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ContentSection(
      title: "TV Shows",
      contents: [
        Content(
          name: "Popular",
          movies: controller?.popularTVShows,
        ),
        Content(
          name: "Airing Today",
          movies: controller?.airingTodayTVShows,
        ),
        Content(
          name: "On The Air",
          movies: controller?.onTheAirTVShows,
        ),
        Content(
          name: "Top Rated",
          movies: controller?.topRatedTVShows,
        ),
      ],
    );
  }
}
