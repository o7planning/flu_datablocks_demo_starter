import 'package:flu_core_rest/flu_core_rest.dart';
import 'package:flu_datablocks/flu_datablocks.dart';
import 'package:flu_datablocks_getx_adapter/flu_datablocks_getx_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../model/model.dart';
import '../../../rest_provider/login_rest_provider.dart';
import '../../dashboard/dashboard_screen.dart';

class LoginController extends AppBaseController {
  LoginRestProvider loginRestProvider = Get.put(LoginRestProvider());

  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  void loginWithUserNamePassword() async {
    showOverlay(asyncFunction: () async {
      processLoginResult();
    });
  }

  Future<void> processLoginResult() async {
    try {
      String userName = formKey.currentState?.instantValue["userName"]!;
      String password = formKey.currentState?.instantValue["password"]!;
      ApiResult<AppUserData> result =
          await loginRestProvider.login(userName, password);
      //
      if (result.errorMessage != null) {
        update();
        showErrorSnackbar(
          message: result.errorMessage!,
          errorDetails: result.errorDetails,
          duration: const Duration(seconds: 4),
        );
        return;
      }
      AppUserData? loggedInUser = result.data;
      if (loggedInUser == null) {
        update();

        showErrorSnackbar(
          message: "No Login Data returned!",
          errorDetails: null,
          duration: const Duration(seconds: 10),
        );
        return;
      }
      //
      await GlobalFlu.setOrUpdateLoggedInUser(loggedInUser);
      //
      Get.offNamed(DashboardScreen.routeName);
    } catch (e, stackTrace) {
      update();
      showErrorSnackbar(
        message: e.toString(),
        errorDetails: null,
        duration: const Duration(seconds: 4),
      );
      print("Error: $e");
      print(stackTrace);
    }
  }
}
