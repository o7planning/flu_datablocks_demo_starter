part of '../model.dart';

@jsonSerializable
class PaymentGatewayInfoPage extends PageDataImpl<PaymentGatewayInfo> {
  PaymentGatewayInfoPage({
    required super.pagination,
    required super.items,
  });

  static PaymentGatewayInfoPage? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static PaymentGatewayInfoPage? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<PaymentGatewayInfoPage>(map);
  }

  static PaymentGatewayInfoPage? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<PaymentGatewayInfoPage>(json);
  }
}
