part of '../model.dart';

@jsonSerializable
class CategoryInfo {
  @JsonProperty(name: 'id')
  late int id;

  @JsonProperty(name: 'name')
  late String name;

  @JsonProperty(name: 'imagePath')
  String? imagePath;

  CategoryInfo(
    this.id,
    this.name,
    this.imagePath,
  );

  CategoryInfo.named({
    required this.id,
    required this.name,
  });
}
