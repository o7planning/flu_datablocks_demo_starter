part of '../model.dart';

@jsonSerializable
class NotificationMessageData {
  @JsonProperty(name: 'id')
  late int id;

  @JsonProperty(name: 'title')
  late String title;

  @JsonProperty(name: 'createDateTime')
  late String createDateTime;

  @JsonProperty(name: 'active')
  late bool active;

  @JsonProperty(name: 'type')
  late String type;

  @JsonProperty(name: 'message')
  late String message;

  NotificationMessageData({
    required this.id,
    required this.title,
    required this.createDateTime,
    required this.active,
    required this.type,
    required this.message,
  });

  static NotificationMessageData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static NotificationMessageData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<NotificationMessageData>(map);
  }

  static NotificationMessageData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<NotificationMessageData>(json);
  }
}
