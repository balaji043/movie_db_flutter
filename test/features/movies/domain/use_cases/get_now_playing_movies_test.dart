// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:movie_db/data/models/models.dart';
import 'package:movie_db/domain/entities/entities.dart';
import 'package:movie_db/features/movies/data/models/movie_models.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entities.dart';
import 'package:movie_db/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_db/features/movies/domain/usecases/movie_usecases.dart';

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
  const PaginatedResponse<MovieDetails> testPaginatedMovieReponse =
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
          const Right<ApiError, PaginatedResponse<MovieDetails>>(
            testPaginatedMovieReponse,
          ),
        ),
      );

      // test call

      final Either<ApiError, PaginatedResponse<MovieEntity>>
          actualPageResponseMovie = await useCase(noParams);

      // asserts
      expect(
        actualPageResponseMovie,
        const Right<ApiError, PaginatedResponse<MovieDetails>>(
            testPaginatedMovieReponse),
      );
      verify(
        mockMovieRepository.getNowPlayingMovies(),
      );
      verifyNoMoreInteractions(mockMovieRepository);
    },
  );
}
