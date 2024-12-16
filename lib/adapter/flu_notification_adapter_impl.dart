import 'package:flu_core_rest/flu_core_rest.dart';
import 'package:flu_datablocks/flu_datablocks.dart';

import '../model/model.dart';

class FluNotificationAdapterImpl implements FluNotificationAdapter {
  @override
  Future<ApiResult<FluNotificationSummary>>
      callApiGetNotificationSummary() async {
    print("fromJson.callApiNotificationSummary()...");
    //
    // NOTE: See tutorial to implement Notification.
    //
    return ApiResult<FluNotificationSummary>.data(null);
  }

  @override
  String toJson(FluNotificationSummary notificationSummary) {
    notificationSummary as AppNotificationSummaryData;
    return notificationSummary.toJson();
  }

  @override
  FluNotificationSummary? fromJson(String json) {
    print("AppNotificationSummaryData.fromJson()");
    return AppNotificationSummaryData.fromJson(json);
  }

  @override
  Future<ApiResult<FluNotification>> callApiGetNotifications() async {
    //
    // NOTE: See tutorial to implement Notification.
    //
    AppNotificationSummaryData empty = AppNotificationSummaryData();
    return ApiResult<FluNotification>.data(null);
  }
}
