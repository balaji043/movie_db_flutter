typedef FromJsonModel<T extends BaseModel> = T Function(Map);

abstract class BaseModel {
  fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
