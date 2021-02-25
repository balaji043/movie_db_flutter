part of 'movie_entities.dart';

class MovieParams extends Equatable {
  final int id;

  const MovieParams(this.id);

  @override
  List<Object> get props => <Object>[id];
}
