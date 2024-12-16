import 'package:flu_core_rest/flu_core_rest.dart';
import 'package:flu_datablocks/flu_datablocks.dart';

import '../model/model.dart';

class FluLoggedInUserAdapterImpl implements FluLoggedInUserAdapter {
  @override
  FluLoggedInUser? fromJson(String json) {
    return AppUserData.fromJson(json);
  }

  @override
  String toJson(FluLoggedInUser fluLoggedInUser) {
    AppUserData user = fluLoggedInUser as AppUserData;
    return user.toJson();
  }
}
