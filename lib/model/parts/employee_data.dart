part of '../model.dart';

@jsonSerializable
class EmployeeData extends EmployeeInfo {
  EmployeeData({
    required super.id,
    required super.empNumber,
    required super.name,
  });

  static EmployeeData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static EmployeeData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<EmployeeData>(map);
  }

  static EmployeeData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<EmployeeData>(json);
  }
}
