part of '../model.dart';

@jsonSerializable
class AppUserInfo {
  @JsonProperty(name: 'id')
  late int id;

  @JsonProperty(name: 'userName')
  late String userName;

  @JsonProperty(name: 'imagePath')
  String? imagePath;

  @JsonProperty(ignore: true)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  AppUserInfo({
    required this.id,
    required this.userName,
    this.imagePath,
  });
}
