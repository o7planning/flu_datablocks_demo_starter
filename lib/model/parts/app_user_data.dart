part of '../model.dart';

@jsonSerializable
class AppUserData extends AppUserInfo implements FluLoggedInUser {
  @JsonProperty(name: 'accessToken')
  String? accessToken;

  @JsonProperty(name: 'email')
  late String email;

  @JsonProperty(name: 'fullName')
  late String fullName;

  @JsonProperty(name: 'enabled')
  late bool enabled;

  @JsonProperty(name: 'activated')
  late bool activated;

  @JsonProperty(name: 'employee')
  EmployeeData? employee;

  // IMPORTANT!!
  @override
  bool get isSystemUser => true;

  AppUserData({
    required super.id,
    required super.userName,
    required this.email,
    required this.fullName,
    required this.enabled,
    required this.activated,
  });

  String toJson() {
    initializeJsonMapper();
    return JsonMapper.toJson(this);
  }

  static AppUserData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static AppUserData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<AppUserData>(map);
  }

  static AppUserData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<AppUserData>(json);
  }
}
