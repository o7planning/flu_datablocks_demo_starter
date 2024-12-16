part of '../model.dart';

@jsonSerializable
class BestSellerDataPage extends PageDataImpl<BestSellerData> {
  BestSellerDataPage({
    required super.items,
    required super.pagination,
  });

  static BestSellerDataPage? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static BestSellerDataPage? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<BestSellerDataPage>(map);
  }

  static BestSellerDataPage? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<BestSellerDataPage>(json);
  }
}
