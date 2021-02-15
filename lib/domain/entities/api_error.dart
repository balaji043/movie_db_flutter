// Package imports:
import 'package:equatable/equatable.dart';

class ApiError extends Equatable {
  final String reason;

  const ApiError(this.reason);

  @override
  List<Object> get props => [reason];
}
