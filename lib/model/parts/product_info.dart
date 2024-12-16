part of '../model.dart';

@jsonSerializable
class ProductInfo {
  @JsonProperty(name: 'id')
  late int id;

  @JsonProperty(name: 'name')
  late String name;

  @JsonProperty(name: 'active')
  late bool active;

  @JsonProperty(name: 'imagePath')
  String? imagePath;

  @JsonProperty(ignore: true)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  ProductInfo(
    this.id,
    this.name,
    this.active,
    this.imagePath,
  );

  ProductInfo.named({
    required this.id,
    required this.name,
    required this.active,
  });
}
