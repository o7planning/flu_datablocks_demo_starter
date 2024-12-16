import 'package:dio/dio.dart';
import 'package:flu_core_rest/flu_core_rest.dart';

import '../config/rest_config.dart';
import '../model/model.dart';

class LoginRestProvider {
  Future<ApiResult<AppUserData>> login(
      String userNameOrEmail, String password) async {
    // Using Flutter DIO library (Not Get_connect).
    var formData = FormData.fromMap({
      "userNameOrEmail": userNameOrEmail,
      "password": password,
    });
    ApiResult<AppUserData> result = await fluDio.restPost(
      "/public/rest/login",
      data: formData,
      converter: AppUserData.fromMap,
    );
    return result;
  }

  Future<ApiResult<void>> logout() async {
    var formData = FormData.fromMap({});
    ApiResult<void> result = await fluDio.restPost(
      "/public/rest/logout",
      data: formData,
      converter: null,
    );
    return result;
  }
}
