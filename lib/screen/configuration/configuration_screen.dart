import 'package:flu_simple_layout/layout/base_screen.dart';
import 'package:flutter/material.dart';

class ConfigurationScreen extends BasicScreen {
  static const String routeName = "/configuration";

  const ConfigurationScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    return Text("Configuration");
  }
}
