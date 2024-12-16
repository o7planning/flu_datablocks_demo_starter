part of '../model.dart';

@jsonSerializable
class CategoryData extends CategoryInfo {
  CategoryData(
    super.id,
    super.name,
    super.imagePath,
  );

  static CategoryData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static CategoryData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<CategoryData>(map);
  }

  static CategoryData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<CategoryData>(json);
  }
}
