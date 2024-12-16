part of '../model.dart';

@jsonSerializable
class ProductData extends ProductInfo {
  @JsonProperty(name: 'category')
  CategoryData? category;

  @JsonProperty(name: 'price')
  late double price;

  @JsonProperty(name: 'estimatedInputPrice')
  late double estimatedInputPrice;

  @JsonProperty(name: 'taxRate')
  late double taxRate;

  @JsonProperty(ignore: true)
  UploadData? uploadImageData;

  ProductData(
    super.id,
    super.name,
    super.active,
    super.imagePath,
    this.price,
    this.estimatedInputPrice,
    this.taxRate,
  );

  static ProductData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static ProductData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<ProductData>(map);
  }

  static ProductData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<ProductData>(json);
  }
}
