part of 'models.dart';

class ProductionCountry {
  String iso31661;
  String name;

  ProductionCountry({this.iso31661, this.name});

  ProductionCountry.fromMap(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    return data;
  }
}
