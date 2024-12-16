part of '../model.dart';

@jsonSerializable
class SalesOrderStatusSummaryData {
  @JsonProperty(name: 'salesOrderCount')
  int salesOrderCount = 0;
  @JsonProperty(name: 'pendingCount')
  int pendingCount = 0;
  @JsonProperty(name: 'processingCount')
  int processingCount = 0;
  @JsonProperty(name: 'deliveriedCount')
  int deliveriedCount = 0;

  SalesOrderStatusSummaryData({
    required this.salesOrderCount,
    required this.pendingCount,
    required this.processingCount,
    required this.deliveriedCount,
  });

  static SalesOrderStatusSummaryData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static SalesOrderStatusSummaryData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<SalesOrderStatusSummaryData>(map);
  }

  static SalesOrderStatusSummaryData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<SalesOrderStatusSummaryData>(json);
  }
}
