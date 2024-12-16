part of '../model.dart';

@jsonSerializable
class EmployeeInfoPage extends PageDataImpl<EmployeeInfo> {
  EmployeeInfoPage({
    required super.items,
    required super.pagination,
  });

  static EmployeeInfoPage? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static EmployeeInfoPage? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<EmployeeInfoPage>(map);
  }

  static EmployeeInfoPage? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<EmployeeInfoPage>(json);
  }
}
