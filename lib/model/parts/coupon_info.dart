part of '../model.dart';

@jsonSerializable
class CouponInfo {
  @JsonProperty(name: 'id')
  late int id;

  @JsonProperty(name: 'code')
  late String code;

  @JsonProperty(name: 'name')
  late String name;

  @JsonProperty(name: 'active')
  late bool active;

  @JsonProperty(name: 'type')
  late String type;

  @JsonProperty(name: 'expiryDate')
  late String expiryDate;

  @JsonProperty(name: 'imagePath')
  String? imagePath;

  @JsonProperty(ignore: true)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  CouponInfo(
    this.id,
    this.code,
    this.name,
    this.active,
    this.type,
    this.expiryDate,
    this.imagePath,
  );

  CouponInfo.named({
    required this.id,
    required this.code,
    required this.name,
    required this.type,
    required this.active,
    required this.expiryDate,
  });

  CouponInfo.empty()
      : id = -1,
        code = '',
        name = '',
        active = false,
        expiryDate = '';
}
