part of 'models.dart';

class Genre extends Equatable {
  final int id;
  final String name;
  const Genre({
    this.id,
    this.name,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
      };

  factory Genre.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return Genre(
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }

  @override
  List<Object> get props => <Object>[id, name];
}
