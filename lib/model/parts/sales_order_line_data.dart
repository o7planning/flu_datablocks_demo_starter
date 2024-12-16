part of '../model.dart';

@jsonSerializable
class SalesOrderLineData {
  @JsonProperty(name: 'id')
  late int id;

  @JsonProperty(name: 'salesOrderId')
  late int salesOrderId;

  @JsonProperty(name: 'productId')
  late int productId;

  @JsonProperty(name: 'productName')
  late String productName;

  @JsonProperty(name: 'units')
  late double units;

  @JsonProperty(name: 'amount')
  late double amount;

  @JsonProperty(name: 'taxAmount')
  late double taxAmount;

  SalesOrderLineData(
    this.id,
    this.salesOrderId,
    this.productId,
    this.productName,
    this.units,
    this.amount,
    this.taxAmount,
  );

  static SalesOrderLineData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static SalesOrderLineData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<SalesOrderLineData>(map);
  }

  static SalesOrderLineData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<SalesOrderLineData>(json);
  }
}
