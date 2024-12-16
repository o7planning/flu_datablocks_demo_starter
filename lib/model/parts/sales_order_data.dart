part of '../model.dart';

@jsonSerializable
class SalesOrderData extends SalesOrderInfo {
  @JsonProperty(name: 'seller')
  EmployeeData? seller;

  @JsonProperty(name: 'customer')
  CustomerData? customer;

  @JsonProperty(name: 'salesOrderLines')
  List<SalesOrderLineData> salesOrderLines = [];

  SalesOrderData(
    super.id,
    super.orderDateTime,
    super.amount,
    super.taxAmount,
    super.status,
  );

  static SalesOrderData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static SalesOrderData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<SalesOrderData>(map);
  }

  static SalesOrderData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<SalesOrderData>(json);
  }
}
