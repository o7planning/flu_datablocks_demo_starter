import 'package:flu_core_rest/flu_core_rest.dart';

import '../config/rest_config.dart';
import '../model/model.dart';

class AppUserRestProvider {
  // /rest/appUserInfoPage
  Future<ApiResult<AppUserInfoPage>> query({
    required PageableData pageable,
    String? searchText,
  }) async {
    Map<String, dynamic>? queryParameters = {
      "currentPage": pageable.page,
      "pageSize": pageable.pageSize,
      "searchText": searchText,
    };

    // /rest/appUserInfoPage
    ApiResult<AppUserInfoPage> result = await fluDio.restGet(
      "/rest/appUserInfoPage",
      responseDataMode: ResponseDataMode.wrappedData,
      queryParameters: queryParameters,
      converter: AppUserInfoPage.fromMap,
    );
    return result;
  }
}
