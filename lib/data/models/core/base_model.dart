typedef FromJsonModel<T extends BaseModel> = T Function(Map);

abstract class BaseModel {
  fromJsonModel(Map<String, dynamic> json);
}
