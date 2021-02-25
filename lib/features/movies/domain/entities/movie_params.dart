// Package imports:
import 'package:equatable/equatable.dart';

class MovieParams extends Equatable {
  final int id;

  const MovieParams(this.id);

  @override
  List<Object> get props => <Object>[id];
}
