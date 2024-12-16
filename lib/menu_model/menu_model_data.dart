import 'package:flu_simple_layout/menus/menu_model.dart';
import 'package:flutter/material.dart';

import '../screen/configuration/configuration_screen.dart';
import '../screen/dashboard/dashboard_screen.dart';
import '../screen/product/product_screen.dart';

List<MenuGroupModel> menuGroupModels = [
  MenuGroupModel(
    title: "Commons",
    subtitle: "Commons description",
    menus: [
      MenuModel(
        code: DashboardScreen.routeName,
        iconData: Icons.home,
        menuTitle: 'Dashboard',
        route: DashboardScreen.routeName,
        markAsSelectedForRoutes: [],
        notifyValue: null,
      ),
    ],
  ),
  MenuGroupModel(
    title: "Features",
    subtitle: "Features description",
    menus: [
      MenuModel(
        code: ProductScreen.routeName,
        iconData: Icons.album,
        menuTitle: 'Product',
        route: ProductScreen.routeName,
        markAsSelectedForRoutes: [],
        notifyValue: null,
      ),
    ],
  ),
];

final configurationMenuModel = MenuModel(
  code: ConfigurationScreen.routeName,
  iconData: Icons.settings,
  menuTitle: 'Configuration',
  route: ConfigurationScreen.routeName,
  markAsSelectedForRoutes: [],
  notifyValue: null,
);
