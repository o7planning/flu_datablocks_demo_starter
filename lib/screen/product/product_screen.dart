import 'package:flu_simple_layout/layout/base_screen.dart';
import 'package:flutter/material.dart';

class ProductScreen extends BasicScreen {
  static const String routeName = "/product";

  const ProductScreen({super.key});

  @override
  Widget buildMainContent(BuildContext context) {
    return const Text("Product");
  }
}
