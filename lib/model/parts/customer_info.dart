part of '../model.dart';

@jsonSerializable
class CustomerInfo {
  @JsonProperty(name: 'id')
  late int id;

  @JsonProperty(name: 'name')
  late String name;

  @JsonProperty(name: 'imagePath')
  String? imagePath;

  @JsonProperty(ignore: true)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  CustomerInfo(
    this.id,
    this.name,
    this.imagePath,
  );

  CustomerInfo.named({
    required this.id,
    required this.name,
  });
}
