part of '../model.dart';

@jsonSerializable
class BestSellerData {
  @JsonProperty(name: 'employeeId')
  late int employeeId;

  @JsonProperty(name: 'employeeNumber')
  late String employeeNumber;

  @JsonProperty(name: 'employeeName')
  late String employeeName;

  @JsonProperty(name: 'imagePath')
  late String? imagePath;

  @JsonProperty(name: 'salesOrderCount')
  late int salesOrderCount;

  @JsonProperty(name: 'amountTotal')
  late double amountTotal;

  @JsonProperty(name: 'taxAmountTotal')
  late double taxAmountTotal;

  @JsonProperty(name: 'estimatedInputAmountTotal')
  late double estimatedInputAmountTotal;

  @JsonProperty(name: 'estimatedProfitTotal')
  late double estimatedProfitTotal;

  @JsonProperty(ignore: true)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  BestSellerData(
    this.employeeId,
    this.employeeNumber,
    this.employeeName,
    this.imagePath,
    this.salesOrderCount,
    this.amountTotal,
    this.taxAmountTotal,
    this.estimatedInputAmountTotal,
    this.estimatedProfitTotal,
  );

  static BestSellerData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static BestSellerData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<BestSellerData>(map);
  }

  static BestSellerData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<BestSellerData>(json);
  }
}
