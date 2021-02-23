// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/api_error.dart';
import 'package:movie_db/domain/entities/no_params.dart';
import 'package:movie_db/features/movies/data/models/movie_details.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_db/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_db/features/movies/domain/usecases/get_now_playing_movies.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  GetNowPlayingMovies useCase;
  MockMovieRepository mockMovieRepository;
  setUp(
    () {
      mockMovieRepository = MockMovieRepository();
      useCase = GetNowPlayingMovies(
        mockMovieRepository,
      );
    },
  );

  const MovieDetails testMovieEntity = MovieDetails(
    id: 464052,
    title: 'Wonder Woman 1984',
    voteAverage: 9,
    posterPath: '/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg',
    releaseDate: '2020-12-16',
  );
  final PaginatedResponse<MovieDetails> testPaginatedMovieReponse =
      PaginatedResponse<MovieDetails>(
    page: 0,
    results: <MovieDetails>[testMovieEntity],
    totalPages: 1,
    totalResults: 1,
  );
  test(
    'should get now playing movies from the movie repository',
    () async {
      // inputs and expected output

      // mocks
      when(mockMovieRepository.getNowPlayingMovies()).thenAnswer(
        (_) => Future<Either<ApiError, PaginatedResponse<MovieDetails>>>.value(
          Right<ApiError, PaginatedResponse<MovieDetails>>(
              testPaginatedMovieReponse),
        ),
      );

      // test call

      final Either<ApiError, PaginatedResponse<MovieEntity>>
          actualPageResponseMovie = await useCase(noParams);

      // asserts
      expect(
        actualPageResponseMovie,
        Right<ApiError, PaginatedResponse<MovieDetails>>(
            testPaginatedMovieReponse),
      );
      verify(
        mockMovieRepository.getNowPlayingMovies(),
      );
      verifyNoMoreInteractions(mockMovieRepository);
    },
  );
}
