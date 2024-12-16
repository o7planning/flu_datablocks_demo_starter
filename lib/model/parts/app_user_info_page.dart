part of '../model.dart';

@jsonSerializable
class AppUserInfoPage extends PageDataImpl<AppUserInfo> {
  AppUserInfoPage({
    required super.items,
    required super.pagination,
  });

  static AppUserInfoPage? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static AppUserInfoPage? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<AppUserInfoPage>(map);
  }

  static AppUserInfoPage? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<AppUserInfoPage>(json);
  }
}
