part of '../model.dart';

@jsonSerializable
class SalesOrderInfoPage extends PageDataImpl<SalesOrderInfo> {
  SalesOrderInfoPage({
    required super.pagination,
    required super.items,
  });

  static SalesOrderInfoPage? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static SalesOrderInfoPage? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<SalesOrderInfoPage>(map);
  }

  static SalesOrderInfoPage? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<SalesOrderInfoPage>(json);
  }
}
