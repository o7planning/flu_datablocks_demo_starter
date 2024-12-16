import 'package:flu_simple_layout/layout/base_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends BasicScreen {
  static const String routeName = "/dashboard";

  const DashboardScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    return const Text("Dashboard");
  }
}
