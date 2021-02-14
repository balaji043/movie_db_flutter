import 'dart:convert';

import 'package:movie_db/data/models/core/base_model.dart';

abstract class Id extends BaseModel {
  int id;
  Id({
    this.id,
  });
}

abstract class Content extends Id {
  String name;
  String posterPath;
  String description;
  Content({this.name, this.posterPath, this.description, int id});
}

class UserCreatedListItem extends Content {
  int favoriteCount;
  int itemCount;
  String iso6391;
  String listType;

  UserCreatedListItem({
    String description,
    this.favoriteCount,
    this.itemCount,
    this.iso6391,
    this.listType,
    String name,
    String posterPath,
    int id,
  }) : super(
          description: description,
          name: name,
          posterPath: posterPath,
          id: id,
        );

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'favoriteCount': favoriteCount,
      'id': id,
      'itemCount': itemCount,
      'iso6391': iso6391,
      'listType': listType,
      'name': name,
      'posterPath': posterPath,
    };
  }

  factory UserCreatedListItem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserCreatedListItem(
      description: map['description'],
      favoriteCount: map['favoriteCount'],
      id: map['id'],
      itemCount: map['itemCount'],
      iso6391: map['iso6391'],
      listType: map['listType'],
      name: map['name'],
      posterPath: map['posterPath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCreatedListItem.fromJson(String source) =>
      UserCreatedListItem.fromMap(json.decode(source));

  @override
  fromJsonModel(Map<String, dynamic> json) => UserCreatedListItem.fromMap(json);
}
