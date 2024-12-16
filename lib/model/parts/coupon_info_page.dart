part of '../model.dart';

@jsonSerializable
class CouponInfoPage extends PageDataImpl<CouponInfo> {
  CouponInfoPage({
    required super.items,
    required super.pagination,
  });

  static CouponInfoPage? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static CouponInfoPage? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<CouponInfoPage>(map);
  }

  static CouponInfoPage? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<CouponInfoPage>(json);
  }
}
