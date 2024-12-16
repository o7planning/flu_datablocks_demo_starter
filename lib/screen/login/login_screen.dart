
import 'package:flu_datablocks_demo_starter/screen/login/section/login_section.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildMain(context),
    );
  }

  Widget _buildMain(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 300,
        height: 360,
        child: LoginSection(),
      ),
    );
  }
}
