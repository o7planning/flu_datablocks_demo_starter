import 'dart:ui';

import 'package:flu_datablocks/flu_datablocks.dart';
import 'package:flu_datablocks_demo_starter/screen/configuration/configuration_screen.dart';
import 'package:flu_datablocks_demo_starter/screen/dashboard/dashboard_screen.dart';
import 'package:flu_datablocks_demo_starter/screen/login/login_screen.dart';
import 'package:flu_datablocks_demo_starter/screen/product/product_screen.dart';
import 'package:flu_datablocks_getx_adapter/flu_datablocks_getx_adapter.dart';
import 'package:flu_dio/rest_debug_screen.dart';
import 'package:flu_simple_layout/flu_simple_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_html/js.dart' as js;

import 'adapter/flu_logged_in_user_adapter_impl.dart';
import 'adapter/flu_notification_adapter_impl.dart';
import 'adapter/flu_simple_layout_adapter_impl.dart';

Future<void> initGlobalsDependencies() async {
  Get.lazyPut(() => TopMenuController(), permanent: true);
 
  ///
  /// Configure Flu Adaptor:
  ///
  await GlobalFlu.config(
    fluDatablocksAdapter: GetxFluDataBlocksAdapter(),
    notificationAdapter: FluNotificationAdapterImpl(),
    loggedInUserAdapter: FluLoggedInUserAdapterImpl(),
    showRestDebugDialog: (BuildContext context) {
      showRestDebugDialog(context);
    },
  );
}

Future<void> main() async {
  await initGlobalsDependencies();

  FluSimpleLayout.config(
    appBaseAdapter: FluSimpleLayoutAdapterImpl(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    _hideHtmlLoadingProgress();
    //
    return GetMaterialApp(
      title: 'Flu-datablocks Demo',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      getPages: [
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: DashboardScreen.routeName,
          page: () => const DashboardScreen(),
        ),
        GetPage(
          name: ProductScreen.routeName,
          page: () => const ProductScreen(),
        ),
        GetPage(
          name: ConfigurationScreen.routeName,
          page: () => const ConfigurationScreen(),
        ),
      ],
    );
  }
}

void _hideHtmlLoadingProgress() {
  try {
    // Call "hideProgress" function in "web/index.html" to hide Loading progress.
    js.context.callMethod('hideProgress', []);
  } catch (e) {}
}
