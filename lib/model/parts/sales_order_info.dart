part of '../model.dart';

@jsonSerializable
class SalesOrderInfo {
  @JsonProperty(name: 'id')
  late int id;

  @JsonProperty(name: 'orderDateTime')
  late String orderDateTime;

  @JsonProperty(name: 'amount')
  late double amount;

  @JsonProperty(name: 'taxAmount')
  late double taxAmount;

  @JsonProperty(name: 'status')
  late String status;

  SalesOrderInfo(
    this.id,
    this.orderDateTime,
    this.amount,
    this.taxAmount,
    this.status,
  );

  SalesOrderInfo.named({
    required this.id,
    required this.orderDateTime,
    required this.amount,
    required this.taxAmount,
    required this.status,
  });
}
