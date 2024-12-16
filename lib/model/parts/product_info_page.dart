part of '../model.dart';

@jsonSerializable
class ProductInfoPage extends PageDataImpl<ProductInfo> {
  ProductInfoPage({
    required super.pagination,
    required super.items,
  });

  static ProductInfoPage? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static ProductInfoPage? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<ProductInfoPage>(map);
  }

  static ProductInfoPage? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<ProductInfoPage>(json);
  }
}
