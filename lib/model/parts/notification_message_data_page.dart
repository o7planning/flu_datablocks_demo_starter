part of '../model.dart';

@jsonSerializable
class NotificationMessageDataPage
    extends PageDataImpl<NotificationMessageData> {
  NotificationMessageDataPage({
    required super.items,
    required super.pagination,
  });

  static NotificationMessageDataPage? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  static NotificationMessageDataPage? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<NotificationMessageDataPage>(map);
  }

  static NotificationMessageDataPage? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<NotificationMessageDataPage>(json);
  }
}
