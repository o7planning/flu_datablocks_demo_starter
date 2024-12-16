part of '../model.dart';

/// <pre>
/// {
///   "data" : [ {
///     "dataName" : "Order",
///     "currentValue" : 133.0,
///     "previousValue" : 168.0,
///     "isMoney": false
///   }, {
///     "dataName" : "Customer",
///     "currentValue" : 133.0,
///     "previousValue" : 168.0,
///     "isMoney": false
///   }, {
///     "dataName" : "Amount",
///     "currentValue" : 144019.1,
///     "previousValue" : 170932.1,
///     "isMoney": true
///   }, {
///     "dataName" : "Tax Amount",
///     "currentValue" : 13156.6,
///     "previousValue" : 15398.4,
///     "isMoney": true
///   } ]
/// }
/// </pre>
///
@jsonSerializable
class SalesOrderSummaryData {
  @JsonProperty(name: 'data')
  late List<CurrentPreviousValue> data;

  SalesOrderSummaryData({
    required this.data,
  });

  factory SalesOrderSummaryData.zero() {
    return SalesOrderSummaryData(
      data: [
        CurrentPreviousValue.zero("--"),
        CurrentPreviousValue.zero("--"),
        CurrentPreviousValue.zero("--"),
        CurrentPreviousValue.zero("--"),
      ],
    );
  }

  static SalesOrderSummaryData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static SalesOrderSummaryData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<SalesOrderSummaryData>(map);
  }

  static SalesOrderSummaryData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<SalesOrderSummaryData>(json);
  }
}
