part of '../model.dart';

@jsonSerializable
class PaymentGatewayData extends PaymentGatewayInfo {
  PaymentGatewayData({
    required super.id,
    required super.name,
    required super.active,
  });

  static PaymentGatewayData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static PaymentGatewayData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<PaymentGatewayData>(map);
  }

  static PaymentGatewayData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<PaymentGatewayData>(json);
  }
}
