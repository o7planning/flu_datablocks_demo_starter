part of '../model.dart';

@jsonSerializable
class CustomerInfoPage extends PageDataImpl<CustomerInfo> {
  CustomerInfoPage({
    required super.items,
    required super.pagination,
  });

  static CustomerInfoPage? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static CustomerInfoPage? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<CustomerInfoPage>(map);
  }

  static CustomerInfoPage? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<CustomerInfoPage>(json);
  }
}
