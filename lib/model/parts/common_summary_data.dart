part of '../model.dart';

@jsonSerializable
class CommonSummaryData {
  @JsonProperty(name: 'totalProduct')
  int totalProduct = 0;
  @JsonProperty(name: 'totalCustomer')
  int totalCustomer = 0;

  CommonSummaryData(
    this.totalProduct,
    this.totalCustomer,
  );

  CommonSummaryData.named({
    required this.totalProduct,
    required this.totalCustomer,
  });

  factory CommonSummaryData.zero() {
    return CommonSummaryData.named(
      totalProduct: 0,
      totalCustomer: 0,
    );
  }

  static CommonSummaryData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static CommonSummaryData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<CommonSummaryData>(map);
  }

  static CommonSummaryData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<CommonSummaryData>(json);
  }
}
