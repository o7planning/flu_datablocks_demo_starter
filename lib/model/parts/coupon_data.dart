part of '../model.dart';

@jsonSerializable
class CouponData extends CouponInfo {
  @JsonProperty(name: 'description')
  String? description;

  CouponData(
    super.id,
    super.code,
    super.name,
    super.active,
    super.type,
    super.expiryDate,
    super.imagePath,
  );
}
