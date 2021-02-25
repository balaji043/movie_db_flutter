part of 'entities.dart';

class ApiError extends Equatable {
  final String reason;

  const ApiError(this.reason);

  @override
  List<Object> get props => <Object>[reason];
}
