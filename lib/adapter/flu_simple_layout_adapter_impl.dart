import 'package:flu_core_rest/flu_core_rest.dart';
import 'package:flu_datablocks/flu_datablocks.dart';
import 'package:flu_simple_layout/flu_simple_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'package:get/get.dart';

import '../logged_in_user/profile_header.dart';
import '../menu_model/menu_model_data.dart';
import '../model/model.dart';
import '../screen/app_notification/app_notification_popup_card.dart';
import '../screen/login/login_screen.dart';
import '../utils/asset_icons.dart';

class FluSimpleLayoutAdapterImpl extends FluSimpleLayoutAdapter {
  final Color topMenuItemBtnColor = Colors.grey.shade300;

  @override
  MenuModel get configurationMenu => configurationMenuModel;

  @override
  List<MenuGroupModel> get menuGroups => menuGroupModels;

  @override
  Widget buildDrawerExpandedProfile(BuildContext context) {
    return const ProfileHeader();
    // return Text("??");
  }

  @override
  Widget buildDrawerCollapsedProfile(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildDrawerExpandedLogo(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: -3, horizontal: -3),
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(
        'static-rs/flu-logo.png',
      ),
      title: const Text(
        "flu-datablocks",
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      subtitle: const Text(
        "Demo",
        style: TextStyle(
          color: Colors.white,
          fontSize: 11,
        ),
      ),
    );
  }

  @override
  Widget buildDrawerCollapsedLogo(BuildContext context) {
    return Image.asset(
      'static-rs/flu-logo.png',
    );
  }

  @override
  TopMenuItemButton buildTopBarMenuDrawerButton(
    BuildContext context,
    MenuDrawerController menuDrawerController,
  ) {
    return TopMenuItemButton(
      icon: Image.asset(
        AssetIcons.menu,
        scale: 3,
        color: topMenuItemBtnColor,
      ),
      onTap: () {
        menuDrawerController.toggle();
        Scaffold.of(context).openDrawer();
      },
    );
  }

  @override
  List<Widget> buildTopBarRightButtons(BuildContext context) {
    FluLoggedInUser? loggedInUser = GlobalFlu.loggedInUser;
    bool isSystemUser = loggedInUser?.isSystemUser ?? false;
    //
    return [
      NotificationButtonBuilder(
        build: (FluNotificationSummary? notificationSummary) {
          notificationSummary as AppNotificationSummaryData?;
          //
          return TopMenuItemButton(
            icon: Image.asset(
              AssetIcons.notification,
              scale: 3,
              color: topMenuItemBtnColor,
            ),
            notificationValue: notificationSummary?.unread ?? 0,
            onTap: () {
              _onTapShowNotifications(context);
            },
          );
        },
      ),
      if (isSystemUser)
        DebugMenu.custom(
          menuItemIconSize: 18,
          menuItemIconColor: null,
          menuButtonBuilder: ({required int errorCount}) {
            return TopMenuItemButton(
              icon: Image.asset(
                AssetIcons.debug,
                scale: 3,
                color: topMenuItemBtnColor,
              ),
              notificationValue: errorCount == 0 ? null : errorCount,
              onTap: () {},
            );
          },
        ),
    ];
  }

  @override
  Widget buildTopBarProfileButton(BuildContext context) {
    return LoggedInUserBuilder(
      locationInfo: getClassName(this),
      description: null,
      build: (FluLoggedInUser? user) {
        AppUserData? appUser = user as AppUserData?;
        return CircleAvatar(
          radius: 20,
          backgroundImage: appUser?.imageUrl == null
              ? null
              : NetworkImage(appUser!.imageUrl!),
          child: InkWell(
            onTapDown: (TapDownDetails details) {
              // Getting the tap position
              final RelativeRect position = RelativeRect.fromLTRB(
                details.globalPosition.dx,
                details.globalPosition.dy + 22,
                details.globalPosition.dx,
                details.globalPosition.dy,
              );

              // Showing the menu
              showMenu(
                context: context,
                position: position,
                items: [
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.language),
                      title: const Text("Vietnamese"),
                      trailing: Get.locale?.languageCode == 'vi'
                          ? const Icon(Icons.check, color: Colors.blue)
                          : null,
                      onTap: () {
                        Get.updateLocale(const Locale('vi', 'VN'));
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.language),
                      title: const Text("English"),
                      trailing: Get.locale?.languageCode == 'en'
                          ? const Icon(Icons.check, color: Colors.blue)
                          : null,
                      onTap: () {
                        Get.updateLocale(const Locale('en', 'US'));
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.login),
                      title: const Text('Logout'),
                      onTap: _logout,
                    ),
                  ),
                ],
              );
            },
            child: Container(),
          ),
        );
      },
    );
  }

  void _onTapShowNotifications(BuildContext context) {
    GlobalFlu.codeFlowLogger.addMethodCall(
      object: this,
      currentStackTrace: StackTrace.current,
      parameters: {},
    );
    //
    showPopupCard(
      context: context,
      builder: (context) {
        return const AppNotificationPopupCard();
      },
      offset: const Offset(-10, 60),
      alignment: Alignment.topRight,
      useSafeArea: true,
      dimBackground: false,
    );
  }

  Future<void> _logout() async {
    GlobalFlu.codeFlowLogger.addMethodCall(
      object: this,
      currentStackTrace: StackTrace.current,
      parameters: {},
    );
    await GlobalFlu.logout(offAllAndGotoRoute: () {
      Get.offAllNamed(LoginScreen.routeName);
    });
  }
}
