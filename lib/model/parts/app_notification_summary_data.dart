part of '../model.dart';

@jsonSerializable
class AppNotificationSummaryData implements FluNotificationSummary {
  @JsonProperty(name: 'unread')
  int unread = 0;

  static AppNotificationSummaryData? fromDynamicData(dynamic data) {
    if (data is String) {
      return fromJson(data);
    } else {
      return fromMap(data);
    }
  }

  String toJson() {
    initializeJsonMapper();
    return JsonMapper.toJson(this);
  }

  static AppNotificationSummaryData? fromMap(Map<String, dynamic> map) {
    initializeJsonMapper();
    return JsonMapper.fromMap<AppNotificationSummaryData>(map);
  }

  static AppNotificationSummaryData? fromJson(String json) {
    initializeJsonMapper();
    return JsonMapper.fromJson<AppNotificationSummaryData>(json);
  }
}
