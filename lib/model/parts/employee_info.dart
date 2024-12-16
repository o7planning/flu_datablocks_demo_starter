part of '../model.dart';

@jsonSerializable
class EmployeeInfo {
  @JsonProperty(name: 'id')
  late int id;

  @JsonProperty(name: 'empNumber')
  late String empNumber;

  @JsonProperty(name: 'name')
  late String name;

  @JsonProperty(name: 'imagePath')
  String? imagePath;

  @JsonProperty(ignore: true)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  EmployeeInfo({
    required this.id,
    required this.empNumber,
    required this.name,
  });
}
