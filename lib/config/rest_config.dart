import 'package:flu_datablocks/flu_datablocks.dart';
import 'package:flu_dio/flu_dio.dart';

import '../config/config.dart';
import '../model/model.dart';

final fluDio = FluDio(
  appBaseURL: appBaseURL,
  getCurrentToken: () {
    AppUserData? user = GlobalFlu.loggedInUser as AppUserData?;
    return user?.accessToken;
  },
);
