// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:movie_db/core/failures.dart';
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';
import 'package:movie_db/domain/entities/no_params.dart';
import 'package:movie_db/domain/repositories/movie_repository.dart';
import 'package:movie_db/domain/use_cases/get_now_playing_movies.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  GetNowPlayingMovies useCase;
  MockMovieRepository mockMovieRepository;
  setUp(
    () {
      mockMovieRepository = MockMovieRepository();
      useCase = GetNowPlayingMovies(
        movieRepository: mockMovieRepository,
      );
    },
  );

  final MovieEntity testMovieEntity = MovieEntity(
    id: 464052,
    title: "Wonder Woman 1984",
    voteAverage: 9.0,
    posterPath: "/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
    releaseDate: "2020-12-16",
  );
  final PaginatedResponse<MovieEntity> testPaginatedMovieReponse =
      PaginatedResponse<MovieEntity>(
    page: 0,
    results: [testMovieEntity],
    totalPages: 1,
    totalResults: 1,
  );
  test(
    'should get now playing movies from the movie repository',
    () async {
      // inputs and expected output

      // mocks
      when(mockMovieRepository.getNowPlayingMovies()).thenAnswer(
        (_) => Future.value(
          Right(testPaginatedMovieReponse),
        ),
      );

      // test call

      final Either<Failure, PaginatedResponse<MovieEntity>>
          actualPageResponseMovie = await useCase(noParams);

      // asserts
      expect(
        actualPageResponseMovie,
        Right(testPaginatedMovieReponse),
      );
      verify(
        mockMovieRepository.getNowPlayingMovies(),
      );
      verifyNoMoreInteractions(mockMovieRepository);
    },
  );
}
