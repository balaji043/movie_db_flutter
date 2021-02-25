// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:movie_db/domain/entities/entities.dart';

// ignore: one_member_abstracts
abstract class UseCase<Type, Params> {
  Future<Either<ApiError, Type>> call(Params params);
}

// typedef UseCase<Type, Params> = Future<Either<ApiError, Type>> Function(
//     Params params);
