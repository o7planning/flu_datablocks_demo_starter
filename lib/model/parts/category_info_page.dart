part of '../model.dart';

@jsonSerializable
class CategoryInfoPage extends PageDataImpl<CategoryInfo> {
  CategoryInfoPage({
    required super.items,
    required super.pagination,
  });

  static CategoryInfoPage? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static CategoryInfoPage? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<CategoryInfoPage>(map);
  }

  static CategoryInfoPage? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<CategoryInfoPage>(json);
  }
}
