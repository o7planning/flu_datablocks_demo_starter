part of '../model.dart';

@jsonSerializable
class CustomerData extends CustomerInfo {
  @JsonProperty(name: 'address')
  String? address;

  @JsonProperty(name: 'phone')
  String? phone;

  @JsonProperty(name: 'email')
  String? email;

  CustomerData(
    super.id,
    super.name,
    super.imagePath,
    this.address,
    this.email,
    this.phone,
  );

  static CustomerData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static CustomerData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<CustomerData>(map);
  }

  static CustomerData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<CustomerData>(json);
  }
}
