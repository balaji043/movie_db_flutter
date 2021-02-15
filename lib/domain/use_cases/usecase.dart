// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../entities/api_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ApiError, Type>> call(Params params);
}
