part of '../model.dart';

@jsonSerializable
class BestSellingDataPage extends PageDataImpl<BestSellingData> {
  BestSellingDataPage({
    required super.items,
    required super.pagination,
  });

  static BestSellingDataPage? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static BestSellingDataPage? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<BestSellingDataPage>(map);
  }

  static BestSellingDataPage? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<BestSellingDataPage>(json);
  }
}
