part of '../model.dart';

@jsonSerializable
class BestSellingData {
  @JsonProperty(name: 'productId')
  late int productId;

  @JsonProperty(name: 'productName')
  late String productName;

  @JsonProperty(name: 'imagePath')
  String? imagePath;

  @JsonProperty(name: 'unitsTotal')
  late double unitsTotal;

  @JsonProperty(name: 'amountTotal')
  late double amountTotal;

  @JsonProperty(name: 'taxAmountTotal')
  late double taxAmountTotal;

  @JsonProperty(ignore: true)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  BestSellingData(
    this.productId,
    this.productName,
    this.imagePath,
    this.unitsTotal,
    this.amountTotal,
    this.taxAmountTotal,
  );

  static BestSellingData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static BestSellingData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<BestSellingData>(map);
  }

  static BestSellingData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<BestSellingData>(json);
  }
}
